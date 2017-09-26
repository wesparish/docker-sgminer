FROM wesparish/amd:17.04-17.10

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && apt-get install -yqq --no-install-recommends \
	vim-tiny \
	flip \
	libcurl3 \
        git \
        dh-autoreconf \
        pkg-config \
        libcurl4-openssl-dev \
        curl \
 && apt-get -yqq clean \
 && rm -rf /var/lib/apt/lists/*

ADD files/sgminer-gm/ /opt/sgminer-gm/
ADD files/docker-entrypoint.sh /opt/docker-entrypoint.sh

WORKDIR /opt

ENV USER="45F1xo1H14LLPTF5LAV5RL89upsnG2e9CgW5LwSchnDFPqe6pbKDWw3bvS37f3sBdAZjUr2xMG3jeE1eyULVogfkCgyfd5N" \
    URL="stratum+tcp://xmr-us-east1.nanopool.org:14444" \
    PASS="x" \
    PROFILE="xmr" \
    GPU_THREADS="2" \
    GPU_FAN="70" \
    THREADS="1"

ENTRYPOINT ["/opt/docker-entrypoint.sh"]

CMD ["/opt/sgminer-gm/sgminer", "-c", "/opt/pool.cfg" ]
