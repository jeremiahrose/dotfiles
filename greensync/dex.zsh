scripts=(
  $GOPATH/src/github.com/greensync/dex-deploy-tools/scripts/set_dex_environment.sh
)

for file in $scripts; do
  [[ -s $file ]] && source $file
done
