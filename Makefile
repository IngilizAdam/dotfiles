CONFIG_DIR := ./configurations

.PHONY: all
all:
	@echo "Read the makefile";

.PHONY: switch
switch:
	nixos-rebuild switch --flake ./#$(TARGET)

.PHONY: build
build:
	nixos-rebuild build --flake ./#$(TARGET)
