# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/daniel.wojnar/.oh-my-zsh"

autoload -U compinit && compinit
autoload -U promptinit; promptinit
prompt pure

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# Add wisely, as too many plugins slow down shell startup.

plugins=(rails ruby git docker zsh-autosuggestions zsh-completions)

# to open local app
alias local_admin='open http://api.local.autoenrolment.co.uk:3000/admin/'
alias local_employee='open http://id.local.autoenrolment.co.uk:3000/employee/sign-in'
alias local_employer='open http://id.local.autoenrolment.co.uk:3000/customer/sign-in'
alias local_antip1='open http://localhost:5000'
# github
alias github="githubApp"
githubApp () {
  repository=${1}
  if [ "$repository" = retire ]; then
    open https://github.com/smartpension/retire-api;
  elif [ "$repository" = infrastructure ]; then
    open https://github.com/smartpension/infrastructure;
  elif [ "$repository" = engineering_docs ]; then
    open https://github.com/smartpension/engineering_docs;
  elif [ "$repository" = test_automation ]; then
    open https://github.com/smartpension/test-automation;
  elif [ "$repository" = help ]; then
     echo retire, infrastructure, engineering_docs, test_automation, api;
  else
    open https://github.com/smartpension/api;
  fi
}
alias tbd_branch="createNewBranch"
createNewBranch () {
  prnum=${1}
  echo Enter branch description:
  read pr_description
  pr_description=${pr_description// /-}
  git checkout -b TBD-$prnum/$pr_description
}
# to open review app
alias review_app="reviewApp"
reviewApp () {
    platform=${1}
    num=${2}
    app=${3} # app is an optional attribute so it has to be last.
   if [ "$platform" = smart ]; then
     if [ "$app" = employer ]; then
       open http://my.pr-$num.dev.autoenrolment.co.uk/;
     elif [ "$app" = employee ]; then
       open http://my.pr-$num.dev.autoenrolment.co.uk/;
     else
       open http://api.pr-$num.dev.autoenrolment.co.uk/admin;
     fi
   elif [ "$platform" = niac ]; then
     if [ "$app" = employer ]; then
       open http://my.pr-$num.dev.mypension365.ie/;
     elif [ "$app" = employee ]; then
       open http://my.pr-$num.dev.mypension365.ie/employee;
     else
       open http://api.pr-$num.dev.mypension365.ie/admin;
     fi
   elif [ "$platform" = heat ]; then
     if [ "$app" = employer ]; then
       open http://my.pr-$num.dev.workplacesolutions.ae/;
     elif [ "$app" = employee ]; then
       open http://my.pr-$num.dev.workplacesolutions.ae/employee;
     else
       open http://api.pr-$num.dev.workplacesolutions.ae/admin;
     fi
   elif [ "$platform" = help ]; then
     echo 'review_app smart 1234 employer';
     echo 'review_app platform number app(defaults to admin if not provided)';
   else
     echo "Platform $platform does not exists";
   fi
}

source /Users/daniel.wojnar/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh
source ~/.zsh-nvm/zsh-nvm.plugin.zsh

export EDITOR=/usr/local/bin/vim
