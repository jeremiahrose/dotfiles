alias gcrli='gcloud container images list --repository=asia.gcr.io/greensync-container-registry'

gcrlt() {
  local full_image_name
  if [[ "$1" =~ ^asia.gcr.io/greensync-container-registry/ ]]; then
    full_image_name="$1"
  else
    full_image_name="asia.gcr.io/greensync-container-registry/$1"
  fi
  gcloud container images list-tags "$full_image_name" --sort-by=TIMESTAMP
}

gcrl() {
  if [[ -n "$1" ]]; then
    gcrlt "$1"
  else
    gcrli
  fi
}
