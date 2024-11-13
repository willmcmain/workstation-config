if command -v nvim
    function vim --wraps=nvim --description 'alias vim=nvim'
    nvim $argv
    end
end
