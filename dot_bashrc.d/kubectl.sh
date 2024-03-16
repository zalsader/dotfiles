alias watch='watch '
source ~/.bash_completion.d/complete_alias
alias k=kubectl
complete -F _complete_alias k

for kconfig in $HOME/.kube/config $(find $HOME/.kube/ -iname "*.config")
do
  if [ -f "$kconfig" ];then
     export KUBECONFIG=$KUBECONFIG:$kconfig
   fi
 done
