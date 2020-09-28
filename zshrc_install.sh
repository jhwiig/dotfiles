#!/usr/bin/zsh

# download syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"

# download git completion (bash + zsh)
curl -o $HOME/.zsh/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o $HOME/.zsh/git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# download zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# download history substring search
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search

# download pure prompt
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"


# write zshrc file
# 1. add our plugins (excluding syntax highlighting)
# 2. put what was there
# 3. add syntax-highlighting (must be last)

ORIGINAL_CONTENTS=$(<$HOME/.zshrc)
cat << EOF >$HOME/.zshrc

# load pure (prompt)
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# one-line pure prompt
prompt_newline='%666v'
PROMPT=' %(?.%F{magenta}❯.%F{red}✖)%f '

# load zsh-autosuggestions
autoload -U compinit; compinit
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# load zsh-history-substring-search
source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# load git completions
fpath+=$HOME/.zsh/

$ORIGINAL_CONTENTS

# load zsh syntax highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF