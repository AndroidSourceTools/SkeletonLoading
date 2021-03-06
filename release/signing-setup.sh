#!/bin/bash

if [[ ! -z "$ENCRYPT_KEY" ]]; then
  # Decrypt GnuPG keyring
  openssl aes-256-cbc -md sha256 -d -in release/secring.gpg.aes -out release/secring.gpg -k ${ENCRYPT_KEY}

  # Decrypt singing properties
  openssl aes-256-cbc -md sha256 -d -in release/signing.properties.aes -out release/signing.properties -k ${ENCRYPT_KEY}

else
  echo "ENCRYPT_KEY is empty"
fi
