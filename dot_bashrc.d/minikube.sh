alias mikbash='kubectl -n rook-ceph exec -it deploy/rook-ceph-tools -- bash'
 mikstart () {
	minikube start --driver=kvm2 --memory="2048" --cpus=2 --kubernetes-version="v1.25.3" --extra-disks=1 --disk-size=40g --nodes=${1:-3} --container-runtime=containerd --insecure-registry="localhost:5000"
}
alias mikdel='minikube delete && mikstopreg'
alias mikreg='minikube addons enable registry && docker run --name=registry-redirect -d --network=host alpine/socat TCP-LISTEN:5000,reuseaddr,fork TCP:$(minikube ip):5000'
alias mikstopreg='docker stop registry-redirect && sudo docker rm registry-redirect'
alias mikcert='kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.10.1/cert-manager.yaml'
