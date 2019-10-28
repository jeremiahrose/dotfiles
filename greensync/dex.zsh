scripts=(
  # $GOPATH/src/github.com/greensync/dex-deploy-tools/scripts/set_dex_environment.sh
  $PROJECTS/dex-core/scripts/shell-utils/dex-environments-vars.sh
  $PROJECTS/dex-core/scripts/shell-utils/jq.sh
  $PROJECTS/dex-core/scripts/shell-utils/jwt.sh
)

for file in $scripts; do
  [[ -s $file ]] && source $file
done

dex-db-dev
dex-dev > /dev/null

export VISION_DB_HOST="$DEX_DB_HOST"
export VISION_DB_USER="$DEX_DB_USER"
export VISION_DB_PASSWORD="$DEX_DB_PASSWORD"
export VISION_DB_DATABASE=vision_dev
export VISION_DB_PORT=5433
