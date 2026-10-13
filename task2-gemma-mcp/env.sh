# Model name on HuggingFace Hub
export MODEL_NAME="google/gemma-4-31B-it"

# Cloud Run Service name
export SERVICE_NAME="gemma4-rtx-vllm-codelab"

# Cloud Project and Region for Cloud Run
export GOOGLE_CLOUD_PROJECT=$(gcloud config get project -q)
export GOOGLE_CLOUD_REGION=$(cat lab2rgn.txt 2> /dev/null || gcloud config get run/region -q)

# Service account for Cloud Run service
export SERVICE_ACCOUNT="vllm-service-sa"
export SERVICE_ACCOUNT_EMAIL="${SERVICE_ACCOUNT}@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com"

# GCS Bucket for the model cache.
export MODEL_CACHE_BUCKET="${GOOGLE_CLOUD_PROJECT}-${GOOGLE_CLOUD_REGION}-hf-model-cache"
# Model cache location in GSC bucket
export GCS_MODEL_LOCATION="gs://${MODEL_CACHE_BUCKET}/model-cache/${MODEL_NAME}"
# Uncomment next line if loading gemma-4-31B-it directly from the public cache bucket
# export GCS_MODEL_LOCATION="gs://vertex-model-garden-public-us/gemma4/gemma-4-31B-it"

# VPC Network for Direct VPC Egress
export VPC_NETWORK="vllm-${GOOGLE_CLOUD_REGION}-net"
export VPC_SUBNET="vllm-${GOOGLE_CLOUD_REGION}-subnet"
export SUBNET_RANGE="10.8.0.0/26"