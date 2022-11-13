#!/bin/bash

# Bash Color
green='\e[32m'
red='\e[31m'
yellow='\e[33m'
blue='\e[34m'
lgreen='\e[92m'
lyellow='\e[93m'
lblue='\e[94m'
lmagenta='\e[95m'
lcyan='\e[96m'
blink_red='\033[05;31m'
restore='\033[0m'
reset='\e[0m'

function info() {
        printf "${lcyan}[   INFO   ]${reset} $*${reset}\n"
}

function success() {
        printf "${lgreen}[ SUCCESS  ]${reset} $*${reset}\n"
}

function warning() {
        printf "${lyellow}[ WARNING  ]${reset} $*${reset}\n"
}

function error() {
        printf "${lmagenta}[  ERROR   ]${reset} $*${reset}\n"
}

function question() {
        printf "${yellow}[ QUESTION ]${reset} "
}

function pause() {
	local message="$@"
	[ -z $message ] && message="Press [Enter] to continue.."
	read -p "$message" readEnterkey
}

function ask() {
    	# http://djm.me/ask
    	while true; do

        	if [ "${2:-}" = "Y" ]; then
        		prompt="Y/n"
        		default=Y
        	elif [ "${2:-}" = "N" ]; then
        		prompt="y/N"
            		default=N
        	else
            		prompt="y/n"
            		default=
        	fi

        	# Ask the question
        	question	
        	read -p "$1 [$prompt] " REPLY

        	# Default?
        	if [ -z "$REPLY" ]; then
        		REPLY=$default
        	fi

        	# Check if the reply is valid
        	case "$REPLY" in
        		Y*|y*) return 0 ;;
        		N*|n*) return 1 ;;
        	esac
    	done
}

# Export architecture:
export ARCH=arm64
export SUBARCH=arm64

# Get GCC toolchain path:
function set_gcc_path(){
	info "Set the absolute path to your GCC toolchain dir:"
	read -p "Path: " GCC_PATH
	export CC=gcc
	export GCC_TRIPLE=aarch64-linux-gnu-
	export CROSS_COMPILE=$GCC_PATH/$GCC_TRIPLE
	export CROSS_COMPILE_ARM32=$GCC_PATH/aarch64-linux-gnueabi-
	success "GCC is now your default compiler."
	pause
}

# Get Clang toolchain path:
function set_clang_path(){
	info "Set the absolute path to your GCC toolchain dir:"
	read -p "Path: " CLANG_PATH
	export CC=clang
	export CLANG_TRIPLE=aarch64-linux-gnu-
	export CROSS_COMPILE=$CLANG_PATH/$CLANG_TRIPLE
	export CROSS_COMPILE_ARM32=$CLANG_PATH/aarch64-linux-gnueabi-
	success "Clang is now your default compiler."
	pause
}

# Clean project:
function clean_all(){
	info "Cleaning config files and project tree..."
	make clean
	info "Cleaning build files..."
	make mrproper
	info "Cleaning out directory..."
	sudo rm -rf out
	mkdir out
	success "Everything cleaned up."
	pause
}

# Set configuration:
function set_config(){
	question "Which config must be applied?"
	select config in "gts6lwifi_eur_open_defconfig" "custom"; do
		case $config in
			"gts6lwifi_eur_open_defconfig")
				sudo make CC=clang O=out ARCH=arm64 $config
				pause
				break;;
			"custom")
				sudo make CC=clang O=out ARCH=arm64 menuconfig
				pause
				break;;
		esac
	done
}

# Build the kernel:
function build_kernel(){
	sudo make CC=$CC O=out ARCH=$ARCH
	
}

# Set default compiler:
function set_compiler(){
	select compiler in "clang" "gcc"; do
		export CC=$compiler
		case $compiler in
			"clang")
				set_clang_path
				break;;
			"gcc")
				set_gcc_path
				break;;
		esac
	done
}

# Main:
end=1
while [ $end -eq 1 ]; do
	clear
	printf "${blue} BUILDER SCRIPT (v0.0.1) ${reset}\n"
	printf "${blue} Author: Jakku Night (@jakkunight ${reset})\n"
	printf "${green} Select your action: ${reset}\n"
	select action in "Clean evironment." "Edit config file." "Set default compiler" "Build the kernel." "Exit"; do
		case $action in
			"Clean evironment.")
				clean_all
				break;;
			"Edit config file.")
				set_config
				break;;
			"Set default compiler")
				set_compiler
				break;;
			"Build the kernel.")
				build_kernel
				break;;
			"Exit")
				end=0
				break;;
		esac
	done
done
