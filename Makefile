CONFIG_DIR := ./configurations

.PHONY: all
all:
	@echo "Read the makefile";

.PHONY: switch check-target-env
switch: check-target-env
	nixos-rebuild switch --flake ./#$(TARGET)

.PHONY: build check-target-env
build: check-target-env
	nixos-rebuild build --flake ./#$(TARGET)

.PHONY: _check-target-env
check-target-env:
ifndef TARGET
	$(error TARGET is not set)
endif
