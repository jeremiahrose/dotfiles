# In order to have a responsive terminal prompt, prevent gcloud-project having to call out to the horribly slow gcloud command when this variable is unset
# Hopefully it doesn't cause any issues that this is not a valid project
if [[ -z "$CLOUDSDK_CORE_PROJECT" ]]; then
  export CLOUDSDK_CORE_PROJECT="(unset)"
fi
