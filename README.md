# Yara-docker

Run DFIR unfurl cli tool in a docker container from https://github.com/obsidianforensics/unfurl

# Usage

This docker image will run `yara` against the url passed as an argument

`docker run -it --rm -v ${PWD}:/app -v <path to rules repo>:<path to rules repo> clausing/yara yara <rules> <files|dir>`
