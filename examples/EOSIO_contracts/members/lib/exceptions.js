const colors = require('colors');

module.exports = eosExceptionHandler;

function eosExceptionHandler(ex = String) {
	if ('string' === typeof ex) ex = JSON.parse(ex);
	let code = Number(ex.code);
	let msg = ex.message;
	switch (code) {
		case 500: console.log(colors.red("DEPLOYMENT EXCEPTION THROWN: "+msg)); break;
		default: console.log(colors.cyan(code)+" "+colors.cyan(msg)); break;
	}

	eosError(ex.error);
}

function eosError(err = Object) {
	console.log(colors.white(err.name.replace(/\_/gi,' ')+" ("+err.code+")"));
	exceptionDetails(err.what, err.details);
}

function exceptionDetails(msg = String, details = Array) {
	if (!(details instanceof Array)) details = [];
	console.log(colors.grey(" "+msg+":"));
	if (details.length <= 0) {
		console.log(colors.grey("  * No specific error details"));
	} else {
		console.log(details);
	}
}