# Action - `{{ save }}`

## Description

The intent of the `{{ save }}` action is to proof existance of a SHA-256 hash at a specific date and time and also which account executes this action. Data will be persisted as part of chain block so user must save transaction id to retrieve that if is needed.

## Parameters

user = `{{ user }}`, is the account name that exececuted the action. Asserted when action is executed.

hash = `{{ hash }}`, is a SHA-256 created from a file or free text.

saveToTable = `{{ saveToTable }}`, if equals true or 1 saves hash and transaction id to the hasher table. This ram will be payed by the action executor and could be released if is needed.

name = `{{ name }}`, used as reference name.

memo = `{{ memo }}`, used as description or summary.

content = `{{ content }}`, used optionally to upload a raw file or free text content. note that this is not checked against hash.