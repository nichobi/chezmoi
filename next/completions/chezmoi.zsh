#compdef _chezmoi chezmoi


function _chezmoi {
  local -a commands

  _arguments -C \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "add:Add an existing file, directory, or symlink to the source state"
      "apply:Update the destination directory to match the target state"
      "archive:Generate a tar archive of the target state"
      "cat:Print the target contents of a file or symlink"
      "cd:Launch a shell in the source directory"
      "chattr:Change the attributes of a target in the source state"
      "completion:Generate shell completion code"
      "data:Print the template data"
      "diff:Print the diff between the target state and the destination state"
      "docs:Print documentation"
      "dump:Generate a dump of the target state"
      "edit:Edit the source state of a target"
      "edit-config:Edit the configuration file"
      "execute-template:Execute the given template(s)"
      "forget:Remove a target from the source state"
      "git:Run git in the source directory"
      "help:Print help about a command"
      "init:Setup the source directory and update the destination directory to match the target state"
      "managed:List the managed entries in the destination directory"
      "purge:Purge all of chezmoi's configuration and data"
      "remove:Remove a target from the source state and the destination directory"
      "source-path:Print the path of a target in the source state"
      "state:Manipulate the state"
      "unmanaged:List the unmanaged files in the destination directory"
      "update:Pull and apply any changes"
      "verify:Exit with success if the destination state matches the target state, fail otherwise"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  add)
    _chezmoi_add
    ;;
  apply)
    _chezmoi_apply
    ;;
  archive)
    _chezmoi_archive
    ;;
  cat)
    _chezmoi_cat
    ;;
  cd)
    _chezmoi_cd
    ;;
  chattr)
    _chezmoi_chattr
    ;;
  completion)
    _chezmoi_completion
    ;;
  data)
    _chezmoi_data
    ;;
  diff)
    _chezmoi_diff
    ;;
  docs)
    _chezmoi_docs
    ;;
  dump)
    _chezmoi_dump
    ;;
  edit)
    _chezmoi_edit
    ;;
  edit-config)
    _chezmoi_edit-config
    ;;
  execute-template)
    _chezmoi_execute-template
    ;;
  forget)
    _chezmoi_forget
    ;;
  git)
    _chezmoi_git
    ;;
  help)
    _chezmoi_help
    ;;
  init)
    _chezmoi_init
    ;;
  managed)
    _chezmoi_managed
    ;;
  purge)
    _chezmoi_purge
    ;;
  remove)
    _chezmoi_remove
    ;;
  source-path)
    _chezmoi_source-path
    ;;
  state)
    _chezmoi_state
    ;;
  unmanaged)
    _chezmoi_unmanaged
    ;;
  update)
    _chezmoi_update
    ;;
  verify)
    _chezmoi_verify
    ;;
  esac
}

function _chezmoi_add {
  _arguments \
    '(-a --autotemplate)'{-a,--autotemplate}'[auto generate the template when adding files as templates]' \
    '(-e --empty)'{-e,--empty}'[add empty files]' \
    '--encrypt[encrypt files]' \
    '(-x --exact)'{-x,--exact}'[add directories exactly]' \
    '(-r --recursive)'{-r,--recursive}'[recursive]' \
    '(-T --template)'{-T,--template}'[add files as templates]' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_apply {
  _arguments \
    '(-i --include)'{-i,--include}'[include entry types]:' \
    '(-r --recursive)'{-r,--recursive}'[recursive]' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    '1: :_files ' \
    '2: :_files ' \
    '3: :_files ' \
    '4: :_files ' \
    '5: :_files ' \
    '6: :_files ' \
    '7: :_files ' \
    '8: :_files '
}

function _chezmoi_archive {
  _arguments \
    '(-z --gzip)'{-z,--gzip}'[compress the output with gzip]' \
    '(-i --include)'{-i,--include}'[include entry types]:' \
    '(-r --recursive)'{-r,--recursive}'[recursive]' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_cat {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    '1: :_files ' \
    '2: :_files ' \
    '3: :_files ' \
    '4: :_files ' \
    '5: :_files ' \
    '6: :_files ' \
    '7: :_files ' \
    '8: :_files '
}

function _chezmoi_cd {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_chattr {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    '1: :("empty" "-empty" "+empty" "noempty" "e" "-e" "+e" "noe" "encrypted" "-encrypted" "+encrypted" "noencrypted" "exact" "-exact" "+exact" "noexact" "executable" "-executable" "+executable" "noexecutable" "x" "-x" "+x" "nox" "first" "-first" "+first" "nofirst" "f" "-f" "+f" "nof" "last" "-last" "+last" "nolast" "l" "-l" "+l" "nol" "once" "-once" "+once" "noonce" "o" "-o" "+o" "noo" "private" "-private" "+private" "noprivate" "p" "-p" "+p" "nop" "template" "-template" "+template" "notemplate" "t" "-t" "+t" "not")' \
    '2: :_files ' \
    '3: :_files ' \
    '4: :_files ' \
    '5: :_files ' \
    '6: :_files ' \
    '7: :_files ' \
    '8: :_files ' \
    '9: :_files '
}


function _chezmoi_completion {
  local -a commands

  _arguments -C \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "bash:Generate bash completion code"
      "fish:Generate fish completion code"
      "powershell:Generate PowerShell completion code"
      "zsh:Generate zsh completion code"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  bash)
    _chezmoi_completion_bash
    ;;
  fish)
    _chezmoi_completion_fish
    ;;
  powershell)
    _chezmoi_completion_powershell
    ;;
  zsh)
    _chezmoi_completion_zsh
    ;;
  esac
}

function _chezmoi_completion_bash {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_completion_fish {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_completion_powershell {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_completion_zsh {
  _arguments \
    '(-h --help)'{-h,--help}'[help for zsh]' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_data {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_diff {
  _arguments \
    '(-i --include)'{-i,--include}'[include entry types]:' \
    '--no-pager[disable pager]' \
    '(-r --recursive)'{-r,--recursive}'[recursive]' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    '1: :_files ' \
    '2: :_files ' \
    '3: :_files ' \
    '4: :_files ' \
    '5: :_files ' \
    '6: :_files ' \
    '7: :_files ' \
    '8: :_files '
}

function _chezmoi_docs {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_dump {
  _arguments \
    '(-i --include)'{-i,--include}'[include entry types]:' \
    '(-r --recursive)'{-r,--recursive}'[recursive]' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    '1: :_files ' \
    '2: :_files ' \
    '3: :_files ' \
    '4: :_files ' \
    '5: :_files ' \
    '6: :_files ' \
    '7: :_files ' \
    '8: :_files '
}

function _chezmoi_edit {
  _arguments \
    '(-a --apply)'{-a,--apply}'[apply edit after editing]' \
    '(-d --diff)'{-d,--diff}'[print diff after editing]' \
    '(-p --prompt)'{-p,--prompt}'[prompt before applying (implies --diff)]' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    '1: :_files ' \
    '2: :_files ' \
    '3: :_files ' \
    '4: :_files ' \
    '5: :_files ' \
    '6: :_files ' \
    '7: :_files ' \
    '8: :_files '
}

function _chezmoi_edit-config {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_execute-template {
  _arguments \
    '(-i --init)'{-i,--init}'[simulate chezmoi init]' \
    '--promptBool[simulate promptBool]:' \
    '--promptFloat[simulate promptFloat]:' \
    '--promptInt[simulate promptInt]:' \
    '(-p --promptString)'{-p,--promptString}'[simulate promptString]:' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_forget {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    '1: :_files ' \
    '2: :_files ' \
    '3: :_files ' \
    '4: :_files ' \
    '5: :_files ' \
    '6: :_files ' \
    '7: :_files ' \
    '8: :_files '
}

function _chezmoi_git {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_help {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_init {
  _arguments \
    '--apply[update destination directory]' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_managed {
  _arguments \
    '(-i --include)'{-i,--include}'[include entry types]:' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_purge {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_remove {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    '1: :_files ' \
    '2: :_files ' \
    '3: :_files ' \
    '4: :_files ' \
    '5: :_files ' \
    '6: :_files ' \
    '7: :_files ' \
    '8: :_files '
}

function _chezmoi_source-path {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    '1: :_files ' \
    '2: :_files ' \
    '3: :_files ' \
    '4: :_files ' \
    '5: :_files ' \
    '6: :_files ' \
    '7: :_files ' \
    '8: :_files '
}


function _chezmoi_state {
  local -a commands

  _arguments -C \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "create:Create the state if it does not already exist"
      "dump:Generate a dump of the state"
      "reset:Reset the state"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  create)
    _chezmoi_state_create
    ;;
  dump)
    _chezmoi_state_dump
    ;;
  reset)
    _chezmoi_state_reset
    ;;
  esac
}

function _chezmoi_state_create {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_state_dump {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_state_reset {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_unmanaged {
  _arguments \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

function _chezmoi_update {
  _arguments \
    '(-a --apply)'{-a,--apply}'[apply after pulling]' \
    '(-i --include)'{-i,--include}'[include entry types]:' \
    '(-r --recursive)'{-r,--recursive}'[recursive]' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]' \
    '1: :_files ' \
    '2: :_files ' \
    '3: :_files ' \
    '4: :_files ' \
    '5: :_files ' \
    '6: :_files ' \
    '7: :_files ' \
    '8: :_files '
}

function _chezmoi_verify {
  _arguments \
    '(-i --include)'{-i,--include}'[include entry types]:' \
    '(-r --recursive)'{-r,--recursive}'[recursive]' \
    '--color[colorize diffs]:' \
    '(-c --config)'{-c,--config}'[config file]:filename:_files' \
    '--debug[write debug logs]' \
    '(-D --destination)'{-D,--destination}'[destination directory]:filename:_files -g "-(/)"' \
    '(-n --dry-run)'{-n,--dry-run}'[dry run]' \
    '--force[force]' \
    '--format[format (json, toml, or yaml)]:' \
    '(-o --output)'{-o,--output}'[output file]:filename:_files' \
    '--remove[remove targets]' \
    '(-S --source)'{-S,--source}'[source directory]:filename:_files -g "-(/)"' \
    '(-v --verbose)'{-v,--verbose}'[verbose]'
}

