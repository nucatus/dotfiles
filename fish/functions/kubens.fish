function kubens
  if test (count $argv) -eq 0
    kubectl get namespaces
    return
  end

  kubectl config set-context --current --namespace $argv[1]
end
