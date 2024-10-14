from pathlib import Path
import os

DOTFILES_ROOT_PATH = Path(__file__).parent
HOME_PATH = Path(os.environ["HOME"])
OHMYZSH_PATH = DOTFILES_ROOT_PATH / "common/zsh/.zsh/.oh-my-zsh"

REPOS = [
    # ohmyzsh
    {
        "url" : "https://github.com/ohmyzsh/ohmyzsh",
        "path" : OHMYZSH_PATH
    },

    # zsh theme
    {
        "url" : "https://github.com/romkatv/powerlevel10k",
        "path": OHMYZSH_PATH / "custom/themes/powerlevel10k"
    },

    # zsh plugins (not inc in ohmyzsh)
    {
        "url" : "https://github.com/joshskidmore/zsh-fzf-history-search",
        "path": OHMYZSH_PATH / "custom/plugins/zsh-fzf-history-search"
    },
    {
        "url" : "https://github.com/zsh-users/zsh-autosuggestions",
        "path": OHMYZSH_PATH / "custom/plugins/zsh-autosuggestions"
    },
    {
        "url" : "https://github.com/zdharma-continuum/fast-syntax-highlighting",
        "path": OHMYZSH_PATH / "custom/plugins/fast-syntax-highlighting"
    },
    {
        "url" : "https://github.com/MichaelAquilina/zsh-you-should-use",
        "path": OHMYZSH_PATH / "custom/plugins/you-should-use"
    }
]