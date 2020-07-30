const EOSJS = require('eosjs');
const fs = require('fs');
const path = require('path');
const colors = require('colors');
// Config
const CONFIG = require(__dirname+'/virosa-config.json');
// Components
const Exceptions = require(__dirname+'/virosa/exceptions.js');
const Contract = require(__dirname+'/virosa/contract.js');
const Account = require(__dirname+'/virosa/account.js');

let allAccounts = ['mitch','mersad','amy','syndicate'];

async function Virosa(config = Object) {

	this.accounts = [];
	this.contracts = [];
	this.creator = config['creator'];

	const eos = EOSJS({keyProvider:[config['private_key']],
		expireInSeconds: 60,
		chainId: config['chain_id']
	});

	allAccounts.forEach(async function(account_name) {

		let NewAccount = Account({
			name:account_name,
			owner:'EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV'
		});

		NewAccount.setProvider(eos);

		NewAccount.create(this.creator, function(err, result) {
			if (err) {
				console.log(colors.red(err));
			} else {
				console.log(colors.cyan(result));
			}
		});
	});

	//DinoAccount.create(this.creator);
	/*
	let MyContract = Contract({
		name: 'members',
		creator: MyAccount.name,
		contractDir: __dirname+'/contracts',
		provider: eos
	});

	MyContract.publish();
	*/
}

Virosa(CONFIG);