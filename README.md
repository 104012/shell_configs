# Shell stuff

## Simple curl clone
`curl -L https://github.com/104012/shell_configs/tarball/master | tar pzx`

## Clean install (old `*rc`s to `*rc.old`)
`mkdir stuff && cd stuff && curl -L https://github.com/104012/shell_configs/tarball/master | tar pzx --strip=1 && ./deploy.sh install && cd .. && rm -rf stuff && source ~/.bashrc`

## Update (will remove current `*rc`s)
`mkdir stuff && cd stuff && curl -L https://github.com/104012/shell_configs/tarball/master | tar pzx --strip=1 && ./deploy.sh update && cd .. && rm -rf stuff && source ~/.bashrc`
