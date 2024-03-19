CONFIG_DIR := ./configurations

#ifndef HOSTNAME
HOSTNAME=$(shell hostname)
#endif

.PHONY: all
all:
	@echo "Read the makefile";

.PHONY: switch _print-hostname-env
switch: _print-hostname-env
	nixos-rebuild switch --flake ./#$(HOSTNAME)

.PHONY: build _print-hostname-env
build: _print-hostname-env
	nixos-rebuild build --flake ./#$(HOSTNAME)

.PHONY: home-manager-switch _print-user-env
home-manager-switch: _print-user-env
	home-manager switch --flake ./#$(USER)

.PHONY: _print-hostname-env
_print-hostname-env:
	@echo "Target HOST=$(HOSTNAME)"

.PHONY: _print-user-env
_print-user-env:
	@echo "Target USER=$(USER)"
