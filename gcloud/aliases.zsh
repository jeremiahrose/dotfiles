alias gcrli='gcloud container images list --repository=asia.gcr.io/greensync-container-registry'

gcrlt() {
  gcloud container images list-tags asia.gcr.io/greensync-container-registry/"$1"
}
