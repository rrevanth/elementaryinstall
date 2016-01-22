export NVM_DIR="/home/raven/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#Virtual Env Variables
export WORKON_HOME=$HOME/.envs
export PROJECT_HOME=$HOME/workspace/envDevel
. /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# Android SDK export
export ANDROID_HOME=$HOME/opt/androidSDK
export NDK_HOME=$HOME/opt/ndk-r10e
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$NDK_HOME:${PATH}

# Make zsh always use default nvm alias in shell.To change node version permanently.change default with 'nvm alias default nodeversion'
# nvm use default > /dev/null

# ADD ~/opt to PATH
 for d in $HOME/opt/*/bin; do PATH="$d:$PATH"; done
 for d in $HOME/bin/*; do PATH="$d:$PATH"; done

# RVM specific installations
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
