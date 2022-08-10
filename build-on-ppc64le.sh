ARCH=$(uname -m)
sudo buildah bud -f Dockerfile -t "$QUAY_REPO":$ARCH .
echo "$QUAY_PASS" | sudo buildah login -u "$QUAY_USER" --password-stdin quay.io
sudo podman push "$QUAY_REPO":$ARCH
