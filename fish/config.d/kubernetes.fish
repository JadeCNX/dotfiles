#
# Kubernetes
#

if not type -q kubectl
  return
end

alias kb='kubectl'

alias kba='kubectl apply'
alias kbc='kubectl config'
alias kbcg='kubectl config get-contexts'
alias kbcu='kubectl config use-context'
alias kbcv='kubectl config view'
alias kbC='kubectl create'
alias kbD='kubectl delete'
alias kbd='kubectl describe'
alias kbe='kubectl exec'
alias kbf='kubectl port-forward'
alias kbg='kubectl get'
alias kbl='kubectl logs'
alias kblf='kubectl logs --follow'
alias kbr='kubectl run'

alias wkb='watch -n 1 kubectl'

function kbn
  kubectl config set-context $(kubectl config current-context) --namespace=$1
end

