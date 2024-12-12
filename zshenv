# This is loaded universally for all types of shell sessions (interactive or non-interactive, login or non-login).
# It is the only configuration file that gets loaded for non-interactive and non-login scripts like cron jobs.

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
addPath "$HOME/dotfiles/bin"

# Disable .NET CLI telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1