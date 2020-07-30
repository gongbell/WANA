#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'open3'
require 'tty-prompt'

EOS_NAME_REGEX = /^[\.1-5a-z]{1,12}[\.a-p]?$/

def main(arguments)
  prompt = TTY::Prompt.new
  context = {}

  context[:arguments] = arguments
  context[:quick_run] = arguments_any?(arguments, '-q', '--quick')
  context[:contract] = ask_contract(prompt)
  context[:action] = ask_action(prompt, context)

  send("perform_#{context[:action]}".to_sym, prompt, context)
end

def ask_contract(prompt)
  default = ENV['CONTRACT_ACCOUNT']
  return default if default

  prompt.ask('Contract:') do |question|
    question.required true
    question.default default
  end
end

def ask_action(prompt, context)
  default = extract_default_action(context[:arguments])
  return default if default

  prompt.select('Action') do |menu|
    menu.choice 'Post', :post
    menu.choice 'Vote', :vote
    menu.choice 'Reset', :reset
    menu.choice 'Scenario', :scenario
  end
end

def perform_scenario(_prompt, context)
  contract = context[:contract]

  posts = [
    { from: 'matt', to: 'eve' },
    { from: 'matt', to: 'eve' },
    { from: 'evan', to: 'eve' },
    { from: 'eve', to: 'matt' },
    { from: 'mike', to: 'matt' },
    { from: 'mike', to: 'eve' },
    { from: 'mike', to: 'evan' },
  ]

  votes = [
    { voter: 'evan', post_id: 0 },
    { voter: 'evan', post_id: 1 },
    { voter: 'mike', post_id: 1 },
    { voter: 'mike', post_id: 3 },
    { voter: 'mike', post_id: 3 },
    { voter: 'evan', post_id: 3 },
    { voter: 'eve', post_id: 4 },
    { voter: 'matt', post_id: 5 },
    { voter: 'matt', post_id: 6 },
    { voter: 'eve', post_id: 6 },
  ]

  posts.each do |post|
    execute_post(contract, {
      from: post[:from],
      to: post[:to],
      memo: "#{post[:from]} -> #{post[:to]}",
    })
  end

  votes.each do |vote|
    execute_vote(contract, {
      post_id: vote[:post_id],
      voter: vote[:voter],
    })
  end
end

def perform_post(prompt, context)
  post = {
    from: ask_account(prompt, context, 'From:', ENV['SHINE_BOT_FROM']),
    to: ask_account(prompt, context, 'To:', ENV['SHINE_BOT_TO']),
    memo: ask_memo(prompt, context),
  }

  puts 'Data:'
  puts JSON.pretty_generate(post)
  puts ''

  puts execute_post(context[:contract], post)
end

def execute_post(contract, post)
  execute_transaction(contract, post[:from], 'post', JSON.generate(post))
end

def ask_memo(prompt, context)
  default = ENV['SHINE_BOT_MEMO'] || ''
  return default if default && context[:quick_run]

  prompt.ask('Memo:') do |question|
    question.required false
    question.default default
  end
end

def perform_vote(prompt, context)
  vote = {
    voter: ask_account(prompt, context, 'Voter: ', ENV['SHINE_BOT_VOTER']),
    post_id: ask_post_id(prompt, context, 'Post Id: ', ENV['SHINE_BOT_POST_ID']),
  }

  puts 'Data:'
  puts JSON.pretty_generate(vote)
  puts ''

  puts execute_vote(context[:contract], vote)
end

def execute_vote(contract, vote)
  execute_transaction(contract, vote[:voter], 'vote', JSON.generate(vote))
end

def ask_post_id(prompt, context)
  default = ENV['SHINE_BOT_POST_ID']
  return default if default && context[:quick_run]

  prompt.ask('post ID:') do |question|
    question.required true
    question.validate /[0-9]+/
    question.convert -> (input) { input.to_i }
  end
end

def perform_reset(_prompt, context)
  puts execute_transaction(context[:contract], context[:contract], 'reset', JSON.generate({ any: 0 }))
end

def ask_account(prompt, context, text, default = nil)
  return default if default

  prompt.ask(text) do |question|
    question.required true
    question.default default
    question.validate EOS_NAME_REGEX
  end
end

def ask_post_id(prompt, context, text, default)
  return default if default

  prompt.ask(text) do |question|
    question.required true
    question.default default
    question.validate /^\d+$/
  end
end

def arguments_any?(arguments, *flags)
  arguments.any? { |input| flags.include? input }
end

def extract_default_action(arguments)
  return :post if arguments_any?(arguments, '--post')
  return :vote if arguments_any?(arguments, '--vote')
  return :reset if arguments_any?(arguments, '--reset')
  return :scenario if arguments_any?(arguments, '--scenario')

  ENV['SHINE_BOT_ACTION'].nil? ? nil : ENV['SHINE_BOT_ACTION'].to_sym
end

def execute_transaction(contract, permission_account, action, data)
  execute_cleos([
    'push',
    'action',
    contract,
    action,
    data,
    '--force-unique',
    '--permission',
    "#{permission_account}@active"
  ])
end

def execute_cleos(arguments)
  wallet_host = ENV['WALLET_HOST']
  wallet_port = ENV['WALLET_PORT']

  options = []
  options << '--wallet-port' << wallet_port if wallet_port
  options << '--wallet-host' << wallet_host if wallet_host

  stdout, stderr, status = Open3.capture3('cleos', *options, *arguments)
  unless status.success?
    puts stderr
    exit(status.exitstatus)
  end

  stdout
end

def sha256(input)
  Digest::SHA256.hexdigest(input)
end

main(ARGV)
