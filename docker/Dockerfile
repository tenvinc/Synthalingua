FROM ubuntu:jammy AS stage0

# Set DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Audio dependencies
RUN apt update && apt install -y alsa-base alsa-utils \
    pulseaudio \
    portaudio19-dev ffmpeg \
    && rm -rf /var/lib/apt/lists/*
    
# Dependencies to build the python packages
RUN apt update && apt install -y git \
    python3.10 python3.10-venv python3.10-dev \
    build-essential cmake \
    && rm -rf /var/lib/apt/lists/*
    
# Setup Synthalingua
RUN mkdir -p /app/Synthalingua
COPY . /app/Synthalingua
WORKDIR /app/Synthalingua
RUN echo "Y\n" | ./setup.bash

COPY --from=dockerfiles ./entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]
CMD ["/bin/bash"]
    

