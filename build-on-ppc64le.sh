ARCH=$(uname -m)
source circleci.env
sudo rm -rf /root/$GH_REPO
git clone -b hosted-multi-arch https://github.com/mayurwaghmode/circleCI-multi-arch.git /root/"$GH_REPO"
cd /root/$GH_REPO
buildah bud -f ppc64le/Dockerfile -t $QUAY_REPO:$ARCH .
echo "$QUAY_PASS" | sudo buildah login -u "$QUAY_USER" --password-stdin quay.io
podman push $QUAY_REPO:$ARCH
#rm ~/circleci.env
