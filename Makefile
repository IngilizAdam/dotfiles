CONFIG_DIR := ./configurations

.PHONY: all
all:
	@echo "Read the makefile";

.PHONY: switch _check-hostname-env
switch: _check-hostname-env
	nixos-rebuild switch --flake ./#$(HOSTNAME)

.PHONY: build _check-hostname-env
build: _check-hostname-env
	nixos-rebuild build --flake ./#$(HOSTNAME)

.PHONY: home-manager-switch _check-user-env
home-manager-switch: _check-user-env
	home-manager switch --flake ./#$(USER)

.PHONY: _check-hostname-env
_check-hostname-env:
ifndef HOSTNAME
	$(error HOSTNAME is not set)
endif

.PHONY: _check-user-env
_check-user-env:
ifndef USER
	$(error USER is not set)
endif
