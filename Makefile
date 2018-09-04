-include .env
export

VAULT_AUTH_METHOD ?= token
VAULT_OPTS ?= -tls-skip-verify

login:
	vault login $(VAULT_OPTS) -method=$(VAULT_AUTH_METHOD)

restore:
	bash ./vault-restore.sh

dump:
	python vault-dump.py > vault-restore-`date +%F`.sh
