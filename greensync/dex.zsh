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

export DEX_DB_RETRY_TIMEOUT=0
export DEX_PUBSUB_PROJECT=greensync-dex-dev
export DEX_PUBSUB_EMULATOR_HOST=localhost:8085
export DEX_PUBSUB_ENVIRONMENT_NAME=dev
export DEX_PUBSUB_SERVICE_ACCOUNT_EMAIL=irrelevant-with-emulator@dev.local

export VISION_DB_HOST="$DEX_DB_HOST"
export VISION_DB_USER="$DEX_DB_USER"
export VISION_DB_PASSWORD="$DEX_DB_PASSWORD"
export VISION_DB_DATABASE=vision_dev
export VISION_DB_PORT=5433

export MOCK_DEVICE_OPERATOR_DB_HOST=localhost
export MOCK_DEVICE_OPERATOR_DB_PORT=5435
