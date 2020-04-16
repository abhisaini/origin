import os
creds = {
  "type": "service_account",
  "project_id": os.environ.get("GC_project_id", ""),
  "private_key_id": os.environ.get("GC_private_key_id", ""),
  "private_key": os.environ.get("GC_private_key", ""),
  "client_email": os.environ.get("GC_client_email", ""),
  "client_id": os.environ.get("GC_client_id", ""),
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/origin-jee%40quicky-14a17.iam.gserviceaccount.com"
}
