# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions

# Custom prompts 1 & 2
export PS1="\n\e[0;32m[\u@\h]\$\n\w \e[m"
export PS2="\n\e[0;33m[>] \e\m"

# Show all files
function l() {
        ls -a
}

# Change dir and l
function c() {
        cd "$@" && l
}

# Easier navigation: cd to .., ..., .... ~ & http dir, all with lsa
alias ..="c .."
alias ...="c ../.."
alias ....="c ../../.."
alias ~="c ~"
alias http="c /srv/http"

# Reload the shell (i.e. invoke as a login shell with .bash_profile, which likely this file)
# switch -l to -i if you just want to reload this file
alias rebash="exec $SHELL -l"

# Nano this file or .nanorc
alias profile="sudo nano ~/.bashrc"
alias nanorc="sudo nano ~/.nanorc"

# List of users
alias userslist='cat /etc/passwd |grep "/bin/bash" |grep "[5-9][0-9][0-9]" |cut -d: -f1'

# List of all users with UID
function userslistall() {
        awk -F":" '{ print "username: " $1 "\t\tuid:" $3 }' /etc/passwd
}

# Create a new dir and enter it
function mkd() {
        mkdir -p "$@" && cd "$@";
}

# Remove a dir and everything inside
function killdir() {
        sudo rm -rf "$@"
}