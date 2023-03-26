# Source all the files in the current directory, except for index.fish
for f in (ls (dirname (status -f))/*.fish | grep -v "index.fish")
  source $f
end
