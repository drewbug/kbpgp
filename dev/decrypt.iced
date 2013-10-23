
{parse} = require '../src/openpgp/parser'
armor = require '../src/openpgp/armor'
fs = require 'fs'
C = require '../src/const'
{KeyBlock} = require '../src/openpgp/processor'
util = require 'util'
{ASP} = require '../src/util'
{KeyManager} = require '../src/keymanager'

msg = """-----BEGIN PGP MESSAGE-----
Version: GnuPG/MacGPG2 v2.0.20 (Darwin)
Comment: GPGTools - http://gpgtools.org

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
WYxrooYFv+qVvVMS
=euQN
-----END PGP MESSAGE-----"""

[err,msg] = armor.decode msg
throw err if err
switch msg.type
  when C.openpgp.message_types.public_key then console.log "Got a public key..."
  when C.openpgp.message_types.private_key then console.log "Got a private key..."
  when C.openpgp.message_types.generic then console.log "Got a generic"
  else throw new Error "unknown msg typ: #{msg.type}"
[err, packets] = parse msg.body
throw err if err
console.log util.inspect packets, { depth : null }

armored_key = """-----BEGIN PGP PRIVATE KEY BLOCK-----
Version: GnuPG/MacGPG2 v2.0.20 (Darwin)
Comment: GPGTools - http://gpgtools.org

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
ObMKV7f7yqGEQNpyrXlHl4qGSzkvgxQ6IzTA1g==
=DRiu
-----END PGP PRIVATE KEY BLOCK-----"""

passphrase = "catsdogs"

asp = new ASP {}
await KeyManager.import_from_armored_pgp { raw : armored_key, asp }, defer err, km
throw err if err?
await km.unlock_pgp { passphrase }, defer err
throw error if err?
km = km.find_pgp_key packets[0].fingerprint
console.log km




