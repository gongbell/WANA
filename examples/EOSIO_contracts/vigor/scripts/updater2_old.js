const url = "https://min-api.cryptocompare.com/data/price?fsym=EOS&tsyms=USD";
const feeder = process.env.feeder
const defaultPrivateKey = process.env.defaultPrivateKey
const account = process.env.account
const interval = process.env.interval
const nodeosurl = process.env.nodeosurl

const { Api, JsonRpc, RpcError } = require('eosjs');
const { JsSignatureProvider } = require('eosjs/dist/eosjs-jssig');
const fetch = require('node-fetch');                                    
const { TextEncoder, TextDecoder } = require('util');               
const axios = require('axios');
const signatureProvider = new JsSignatureProvider([defaultPrivateKey]);
const rpc = new JsonRpc(nodeosurl, { fetch });
const api = new Api({ rpc, signatureProvider, textDecoder: new TextDecoder(), textEncoder: new TextEncoder() });

function write(){

	axios.get(`${url}`)
		.then(results=>{

			if (results.data && results.data.USD){

				console.log(" results.data.USD",  results.data.USD);


				(async () => {
					const result = await api.transact({
					  actions: [{
						account: account,
						name: 'write',
						authorization: [{
						  actor: feeder,
						  permission: 'active',
						}],
						data: {
						  owner: feeder,
						  value: parseInt(Math.round(results.data.USD * 10000)),
						},
					  }]
					}, {
					  blocksBehind: 3,
					  expireSeconds: 30,
					});
					console.dir(result);
				  })();

			}
			else setTimeout(write, interval);

		})
		.catch(error=>{
			console.log("error:", error);
			setTimeout(write, interval);
		});

}


write();

setInterval(write, 60000);


