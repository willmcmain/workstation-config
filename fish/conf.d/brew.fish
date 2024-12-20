set brew /opt/homebrew/bin/brew

if test -e $brew
    eval ($brew shellenv)
end
