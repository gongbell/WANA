// Modules
const fs = require('fs');
const path = require('path');
// Utils
const Account = require('./account.js');
const Exceptions = require('./exceptions.js');

// @note Let the constructor and publish function take a directory string straight to the contract
// 			Construct the name and abi/wasm locations from scanning this directory.

class Contract extends Account {

	constructor() {
		this.name = module.name;
		// Contract publisher account
		this.creator = module.creator;
		// Configured EOSjs instance
		this.provider = module.provider;
		// Base contract directory
		this.dir =  module.contractDir;
		this.abi = {};
		this.code = "";
	}

	/**
	 * Set Provider
	 * @desc Sets the EOSjs provider
	 * @author [Mitch Pierias](github.com/MitchPierias)
	 * @param provider <Object> Configured EOSjs Instance
	 * @version 1.0.0
	 * @return
	 */
	setProvider(provider) {
		if ('object' !== typeof provider) return false;
		this.provider = provider;
	}

	/**
	 * Publish
	 * @desc Publishes contract to the blockchain
	 * @author [Mitch Pierias](github.com/MitchPierias)
	 * @note Requires file exists validation, success and exception handling
	 * @version 0.1.0
	 * @return
	 */
	publish() {
		// Capture arguments
		let contractName = this.name;
		let accountName = this.creator;
		// Read contract data
		let abi = fs.readFileSync(`${this.dir}/${contractName}/${contractName}.abi`);
		let wasm = fs.readFileSync(`${this.dir}/${contractName}/${contractName}.wasm`);
		// Deploy contract to the blockchain
		this.provider.transaction(function(tr) {
			tr.setcode(accountName, 0, 0, wasm) // @returns {Promise}
			tr.setabi(accountName, JSON.parse(abi)) // @returns {Promise}
		}).catch(Exceptions);
	}

	deployed() {
		// Get the contract at address
		// Return the contract object
	}

	/**
	 * Set Address
	 * @desc Set's the code deployment account name
	 * @author [Mitch Pierias](github.com/MitchPierias)
	 * @param address <String> Contract account name
	 * @version 1.0.0
	 * @return
	 */
	at(address) {
		if ('string' !== typeof address || address.length <= 0) address = this.name;
		this.name = address;
	}

	address() {
		// Return deployed address name and code
	}
}

module.exports = Contract;