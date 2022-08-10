ARCH=$(uname -m)
buildah bud -f Dockerfile -t $QUAY_REPO:$ARCH .
echo "$QUAY_PASS" | sudo buildah login -u "$QUAY_USER" --password-stdin quay.io
podman push $QUAY_REPO:$ARCH
