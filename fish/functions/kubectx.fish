function kubectx
  if test (count $argv) -eq 0
    kubectl config get-contexts
    return
  end

 kubectl config use-context $argv[1]
end
