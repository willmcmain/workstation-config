function fish_mode_prompt --description 'Displays the current mode'
    # To reuse the mode indicator use this function instead
    if test $fish_bind_mode != 'insert'
        fish_default_mode_prompt
    end
end
