export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# This loads nvm bash_completion

function cra() {
  if [ -z $1 ]; then
    echo "Usage: cra <project-name>"
    return
  fi

    npx create-react-app $1
  cd $1
    rm src/App.test.js src/App.css src/serviceWorker.js src/logo.svg
    mkdir src/components
}

