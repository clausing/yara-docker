FROM ubuntu:latest
LABEL maintainer "Jim Clausing, jclausing@isc.sans.edu"
LABEL version="yara 4.5.0"
LABEL date="2024-03-04"
LABEL description="Run yara in a docker container"

# Install dependencies
RUN apt-get update && apt-get -y install --no-install-recommends wget unzip ca-certificates curl gcc make pkg-config libprotobuf-dev libprotobuf23 autoconf automake libtool libltdl-dev libc6-dev zlib1g-dev

ENV PYTHONUNBUFFERED 1

# Install YARA
WORKDIR /tmp
RUN wget https://github.com/VirusTotal/yara/archive/refs/heads/master.zip -O yara.zip && unzip yara.zip && rm yara.zip && mv yara-master yara
WORKDIR /tmp/yara
RUN ./bootstrap.sh && ./build.sh && make install && ldconfig

# Set the working directory to /app
WORKDIR /app

# Set the default command to run Yara 
ENTRYPOINT ["/usr/local/bin/yara"]
CMD ["--help"]
