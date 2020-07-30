const ecc = require('eosjs').modules.ecc;
const colors = require('colors');

module.exports = function(config = Object) {

	return {

		name: config.name,

		owner: config.owner,

		active: config.active || config.owner,

		keys:[],

		/**
		 * Set Provider
		 * @desc Sets the EOSjs provider
		 * @author [Mitch Pierias](github.com/MitchPierias)
		 * @param provider <Object> Configured EOSjs Instance
		 * @version 1.0.0
		 * @return
		 */
		setProvider: function(provider) {
			if ('object' !== typeof provider) return false;
			config.provider = provider;
		},

		/**
		 * Create Account
		 * @desc Creates a new account
		 * @author [Mitch Pierias](github.com/MitchPierias)
		 * @param creator <String> Account creator
		 * @version 1.0.0
		 * @return
		 */
		create: async function(creator, callback) {

			if ('string' !== typeof creator || creator.length <= 0) throw new Error("Account creator not defined");

			let account_name = this.name;
			let owner_key = this.owner;
			let active_key = this.active;

			let result = await config.provider.newaccount({
				creator: creator,
				name: account_name,
				owner: owner_key,
				active: active_key
			}).then(function(receipt) {
				if ('function' === typeof callback) callback(false, "Account '"+account_name+"' created");
			}).catch(function(err) {
				if ('function' === typeof callback) callback("Account '"+account_name+"' already exists");
			});

			if ('function' !== typeof callback) return result;
		},

		/**
		 * Generate Private Keys
		 * @desc Generates unique private keys
		 * @author [Mitch Pierias](github.com/MitchPierias)
		 * @param count <Number> Number of keys to generate
		 * @param callback <Function> Callback function
		 * @version 0.1.0
		 * @return seeds <Array> Array of generated seeds
		 */
		generatePrivateKeys: async function(count = 1, callback) {
			if ('number' !== typeof count) count = 1;
			let seeds = new Array(count);
			for (let i=0;i<seeds.length; i++) {
				seeds[i] = await ecc.randomKey();
			}
			// Return results
			if ('function' !== typeof callback) return seeds;
			callback(seeds);
		},

		/**
		 * Generate Public Keys
		 * @desc Generates unique public keys from provided private keys
		 * @author [Mitch Pierias](github.com/MitchPierias)
		 * @param seeds <Array> Array of private keys
		 * @param callback <Function> Callback function
		 * @version 0.1.0
		 * @return seeds <Array> Array of private/public key pair objects
		 */
		generatePublicKeysFromSeeds: async function(seeds = Array, callback) {
			if (!(seeds instanceof Array)) seeds = [];
			let keyPairs = [];
			//const kys = await Promise.all(promises)
			keyPairs = seeds.map(key => {
				return {private: key, public: ecc.privateToPublic(key)}
			});
			// Return results
			if ('function' !== typeof callback) return keyPairs;
			callback(keyPairs);
		}
	}
}