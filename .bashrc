# file: .bashrc
# created: 2025-01-24 02:09 AM
# updated: 2025-02-07 06:13 PM

# non-interactive shell: do nothing
[[ $- != *i* ]] && return

# set: source path from which to source bash files.
#
# for root, this can be /home/your-username but is
# generally considered unsafe.
source_path=$HOME

# interactive shell: initialize bash
[ -r $source_path/.bash_config ]    && source $source_path/.bash_config
[ -r $source_path/.bash_functions ] && source $source_path/.bash_functions
[ -r $source_path/.bash_exports ]   && source $source_path/.bash_exports
[ -r $source_path/.bash_aliases ]   && source $source_path/.bash_aliases

unset source_path
