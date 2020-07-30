const config = require("./config");

// https://github.com/EOSIO/eos/issues/3411#issuecomment-392036376
const sysAccounts = [
    'eosio.bpay',
    'eosio.msig',
    'eosio.names',
    'eosio.ram',
    'eosio.ramfee',
    'eosio.saving',
    'eosio.stake',
    'eosio.token',
    'eosio.upay'
];

const ecc = require("eosjs-ecc");
const sysPubKey = ecc.privateToPublic(config.sysPrivKey);

async function createSysAccount(eos, name) {

    console.log("Creating system account \x1b[33m" + name + "\x1b[0m...");

    await eos.transaction(tr => {
        tr.newaccount({
            creator: "eosio",
            name: name,
            owner: sysPubKey,
            active: sysPubKey
        })
    });
}

async function initializeSystem(eos) {

    console.log("Creating system accounts...");
    for (let i = 0; i < sysAccounts.length; i++) {
        await createSysAccount(eos, sysAccounts[i]);
    }

    console.log("Creating EOS tokens...");
    const fs = require("fs");
    const tokenWasm = fs.readFileSync("./contracts/eosio.token.wasm");
    const tokenAbi = JSON.parse(fs.readFileSync("./contracts/eosio.token.abi"));
    await eos.setcode("eosio.token", 0, 0, tokenWasm);
    await eos.setabi("eosio.token", tokenAbi);
    await eos.transaction("eosio.token", token => {
        token.create("eosio", "1000000000.0000 EOS", { authorization: "eosio.token@active" });
        token.issue("eosio", "1000000000.0000 EOS", "Initial supply", { authorization: "eosio@active" });
    });

    console.log("Publishing eosio.system account...");
    const systemWasm = fs.readFileSync("./contracts/eosio.system.wasm");
    const systemAbi = JSON.parse(fs.readFileSync("./contracts/eosio.system.abi"));
    await eos.setcode("eosio", 0, 0, systemWasm);
    await eos.setabi("eosio", systemAbi);
}

module.exports = {
    initSys: initializeSystem
}