npm install -g typescript-language-server typescript eslint prettier vscode-langservers-extracted pyright ts-node
go install github.com/mattn/efm-langserver@latest
brew install kotlin-language-server
apt install ktlint clangd lldb

git clone https://github.com/microsoft/vscode-js-debug.git
cd vscode-js-debug
npm install
npm run compile
