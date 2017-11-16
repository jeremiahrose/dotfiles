# Installation:
#   yaourt -S nvm
#   npm install -g avn avn-nvm avn-n
#   avn setup

scripts=(
  /usr/share/nvm/init-nvm.sh
  ~/.avn/bin/avn.sh
)

for file in $scripts; do
  [[ -s $file ]] && source $file
done
