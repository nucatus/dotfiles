# Go (if go is installed)
if command -vq go
  if not string match -q '*go\/libexec*' $PATH
    set -x GOPATH $HOME/go
    set -x GOROOT /usr/local/opt/go/libexec
    set -x PATH $GOPATH $PATH
    set -x PATH $GOPATH/bin $PATH
  end
end
