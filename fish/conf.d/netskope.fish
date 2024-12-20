set -Ux NETSKOPE_CA_BUNDLE "$HOME/.config/netskope/nscacert_combined.pem"
if command -q gcloud
    gcloud config set core/custom_ca_certs_file "$NETSKOPE_CA_BUNDLE"
end
set -Ux REQUESTS_CA_BUNDLE "$NETSKOPE_CA_BUNDLE"
set -Ux NODE_EXTRA_CA_CERTS "$NETSKOPE_CA_BUNDLE"
set -Ux CURL_CA_BUNDLE "$NETSKOPE_CA_BUNDLE"
set -Ux SSL_CERT_FILE "$NETSKOPE_CA_BUNDLE"
set -Ux HEX_CACERTS_PATH "$NETSKOPE_CA_BUNDLE"
