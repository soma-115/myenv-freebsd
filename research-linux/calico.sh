echo "-- calico --"
git clone git@github.com:oss-fun/souma-calico.git -b release-v3.28 ~/souma-calico
git clone git@github.com:oss-fun/souma-calico-bird.git -b feature-ipinip ~/souma-calico-bird

cd ~/souma-calico/cni-plugin
go build -o ~/bin/calico ./cmd/calico
cp ~/bin/calico ~/bin/calico-ipam
sudo mv ~/bin/calico /opt/cni/bin/calico
sudo mv ~/bin/calico-ipam /opt/cni/bin/calico-ipam

cd ~/souma-calico/calicoctl
go build -o ~/bin/calicoctl ./cmd/calicoctl.go

cd ~/souma-calico/felix
CGO_ENABLED=0 go build -o ~/bin/calico-felix -buildvcs=false ./cmd/calico-felix/

cd ~/souma-calico-bird
sudo apt install -y autoconf gcc bison libtool flex make
autoreconf
./configure  --with-protocols="bfd bgp pipe static" --enable-client=no --enable-pthreads=yes -with-sysconfig=linux --build=amd64 --host=amd64 --runstatedir=/var/run/calico
make
cp ./bird ~/bin/bird
cp ./birdcl ~/bin/birdcl
