# Yara-docker

Run yara tool in a docker container 

# Usage

This docker image will run `yara` against the file or directory on the host

`docker run -it --rm -v ${PWD}:/app -v <path to rules repo>:<path to rules repo> clausing/yara yara <rules> <files|dir>`
