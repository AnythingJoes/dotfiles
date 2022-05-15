if status is-interactive
    set -gx EDITOR nvim
    set -gx SDL_VIDEODRIVER x11
    set -gx PATH "$HOME/bin" $PATH
    # Commands to run in interactive sessions can go here
    fish_ssh_agent
end
