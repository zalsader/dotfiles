source <(kubectl completion bash)

alias watch='watch '
source ~/.bash_completion.d/complete_alias
alias k=kubectl
complete -F _complete_alias k

alias kx='kubectx'
complete -F _complete_alias kx

alias kns='kubens'
complete -F _complete_alias kns

alias tf='terraform'
complete -F _complete_alias tf

for kconfig in $HOME/.kube/config $(find $HOME/.kube/ -iname "*.config")
do
  if [ -f "$kconfig" ];then
     export KUBECONFIG=$KUBECONFIG:$kconfig
   fi
 done
