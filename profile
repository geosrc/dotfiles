# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Add Rust tools
# CLI tools installed via Rust's Cargo package manager should always be available.
if [ -s "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# Add NVM/Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add Pico SDK (Raspberry Pi Pico)
export PICO_DIR="$HOME/pico"
if [ -d "$PICO_DIR" ] ; then
    export PICO_SDK_PATH="$PICO_DIR/pico-sdk"
    export PICO_EXAMPLES_PATH="$PICO_DIR/pico-examples"
    export PICO_EXTRAS_PATH="$PICO_DIR/pico-extras"
    export PICO_PLAYGROUND_PATH="$PICO_DIR/pico-playground"
fi

# Prepend directories to PATH if they exist and are not already in PATH
function addPath {
    if [ ! -d "${1}" ]; then
        # echo "[addPath] Directory not found: ${1}"
        return
    fi

    case ":${PATH}:" in
        *:"${1}":*)
            ;;
        *)
            # echo "[addPath] Adding to PATH: ${1}"
            export PATH="${1}:$PATH"
            ;;
    esac
}

addPath "/usr/local/bin"
addPath "$HOME/.local/bin"
addPath "$HOME/bin"

# Disable .NET CLI telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1