




             EOS Blockchain and Go

                 May 7th 2018



  Alexandre Bourget - Co-founder at EOS Canada

                   @eos_canada


















Introduction
------------

Welcome to Golang Montreal. Special blockchain edition.

As you know, there a global Hackathon called Hack Til Dawn, that
starts on May 12th.  Runs for 2 weeks...

Teams from all over the world will race to ship the best application
they can build in a short timeframe.

There are huge prizes to win.

We thought it would be tremendeously useful to give the Go community
an unfair advantage by showcasing the different tools we have built
that make building dapps a lot easier.

Join our Telegram channel if you have any questions regarding these
things we'll present today.



Content
-------

Today we will:
* Boot a node
* Learn a bit about how EOS structures its data
* Expose a small dapps,
* Code a Go command line tool to interface with a smart contract on the EOS blockchain.

EOS is really cool. This is not financial advice.

The demo today is based on `dawn3` release. This week we're expecting
a new release (4 weeks sprint :P). A lot changes, and our lib will be
updated alongside the May 11th release.

* A few things will change. The most obvious is how signatures will
  not look alike in Dawn4. They're prefixed with PVT, PUB and SIG with
  the curve selected.



Boot
----

Some might know, we are block producer candidates, and we have built a tool to launch networks.

We think it is a good contender to actually launch the main network on June 2nd.

Most complete launch tool to date:

* We developed an open protocol for anyone to participate in the launch.
  * It's fully decentralized, so has no central point of failure.
  * It allows candidates to vote for their peers to say something like:
    * I'd like to launch the main network with them, I think they're going to do a great job
      at running this network.
      * It's a first vetting by people who should know what they're talking about, pointing
        towards who they think are the best in the space right now.

Anyone can use it, this example configuration uses a Docker instance running locally:

    j sample
    ./eos-bios boot

Show docker logs.  Producing, etc..

Add private key to my wallet.






Employee Rewards Program
------------------------

Shopify was amongst the first to publish info about their Unicorn system.

* https://www.shopify.ca/blog/3737412-a-peek-at-unicorn-our-internal-software-used-to-improve-employee-communication-collaboration-and-compensation

Post content, people vote, unicorn, etc..

View the shine.cpp / shine.hpp:

 * Smart contracts are C++ right now

Go to shine:

    j shine

Create the `shine` account.

    cleos create key
    cleos wallet import PRIVKEY

    cleos set contract shine `pwd` shine.wast shine.abi

Create our users' accounts:

    cleos create account eosio joe PUBKEY PUBKEY
    cleos create account eosio jane PUBKEY PUBKEY
    cleos create account eosio bob PUBKEY PUBKEY
    cleos create account eosio alice PUBKEY PUBKEY

Explore tables:

    cleos get table shine shine posts
    cleos get table shine shine votes
    cleos get table shine shine memberstats
    cleos get table shine shine rewards


We'll use that same key, but obviously, different users would have
different keys on their account.

Interact with the contract:

    cleos push action shine post '{"from": "joe", "to": "jane", "memo": "for the bitcoin on EOS through Ethereum"}' -p joe
    cleos push action shine vote  '{"voter": "alice", "post_id": 0}' -p alice


Show how much eosio has money:

    cleos get currency balance eosio.token eosio




Overview of the Go library
--------------------------


All of this material is available on our GitHub repository, under the
`eoscanada` organization.


Features:
* Key management (sign things through the `keosd` wallet AND implement a wallet).
  * show gowallet/main.go

* p2p protocol, first lib to implement the p2p protocol, except the C++ codebase.
  * Show sample p2p-proxy

* Structs for most system contracts, and a nice pattern to create your own.
  * Important bits: which account it goes to, and which "function" it calls..
    also, which authorization you think is necessary to satisfy the contract..
    because it will check for authorizations..

* Packing / unpacking: **types_test.go:220**

* Pub/privkey handling, ecc library


Coding that in Go
-----------------

Our goal, provide a dedicated command line tool.

We'll create a new `cobra` application. Cobra is a nice command-line
tool building tool by Steve Francia who now works on the Go team at
Google.

    cobra init github.com/eoscanada/shine/shine

Clean-up `main.go` ..

    cobra add post
    cobra add vote

Add `--from` to `root.go` and other options:

	RootCmd.PersistentFlags().StringVarP(&fromAccount, "from", "f", "", "From account name")


Inside `post.go`:

```go

	Use:   "post --from=account [account] [message]",
	Short: "Submit a new post to the rewards system",
	Args:  cobra.ExactArgs(2),
	Run: func(cmd *cobra.Command, args []string) {
		chainID := make([]byte, 32, 32)

		api := eos.New("http://localhost:8888", chainID)
		api.SetSigner(eos.NewWalletSigner(eos.New("http://localhost:6667", chainID), "default"))

		if _, err := api.SignPushActions(NewPost(fromAccount, args[0], args[1])); err != nil {
			log.Fatalln(err)
		}
		fmt.Println("Done")
	},
```

* ExtractArgs: cobra feature, make sure we have two params as strings
* chainID: this is to distinguish the chain you're talking to.. because there can be many EOS chains that do inter-blockchain communications.
* we're creating an API wrapper.
* we're setting a NewWalletSigner
  * we also have a KeyBag

Now let's go COPY the `system/newaccount.go` that we've seen in the overview, we'll tweak it until it's unrecognizable.

Stop me with any questions.

```go
func NewPost(from, to, message string) *eos.Action {
	return &eos.Action{
		Account: eos.AccountName("shine"),
		Name:    eos.ActionName("post"),
		Authorization: []eos.PermissionLevel{
			{Actor: eos.AccountName(from), Permission: eos.PermissionName("active")},
		},
		Data: eos.NewActionData(Post{
			From: eos.AccountName(from),
			To:   eos.AccountName(to),
			Memo: message,
		}),
	}
}

type Post struct {
	From eos.AccountName `json:"from"`
	To   eos.AccountName `json:"to"`
	Memo string          `json:"memo"`
}
```


Now in `vote.go`:

* ADD THE FLAG `post_id`:

```
    voteCmd.Flags().IntVarP(&votePostID, "post_id", "p", 0, "Specify the post-id")
```

* Copy the `post.go` content for the content body. Tweak only the `NewPost` -> `NewVote`

```
		action := NewVote(fromAccount, votePostID)
```

* Copy the `Post` struct and `NewPost`, and tweak for `Vote`:

```
func NewVote(from string, votePostID int) *eos.Action {
	return &eos.Action{
		Account: eos.AccountName("shine"),
		Name:    eos.ActionName("vote"),
		Authorization: []eos.PermissionLevel{
			{Actor: eos.AccountName(from), Permission: eos.PermissionName("active")},
		},
		Data: eos.NewActionData(Vote{
			From:   eos.AccountName(from),
			PostID: uint64(votePostID),
		}),
	}
}

type Vote struct {
	From   eos.AccountName `json:"from"`
	PostID uint64          `json:"post_id"`
}
```


Dispatch the moneeeey:

    cleos get currency balance eosio.token eosio
    cleos push action eosio.token transfer '{"from": "eosio", "to": "shine", "quantity": "1000.0000 EOS", "memo": "Good luck with the pot"}' -p eosio


Conclusion
----------

* We have booted a node using `eos-bios`, a simple one-liner.
* We have looked at a simple dapp inspired by Shopify.
* We have implemented a command line tool to sign transactions to the
blockchain using a local wallet.

Remember: May 12th starts the global Hack Til Dawn hackathon. Join us
and ask any questions over there.

If you build anything using our tools, let us know, we'll Tweet about
them, review, and showcase, etc..

During the hackathon, we will be on all comms channel to support you
guys in using those tools.  Don't hesitate to ask questions, join our
Telegram channel, follow us on Twitter, and subscribe to our YouTube
channel, where videos like this presentation will be posted.
