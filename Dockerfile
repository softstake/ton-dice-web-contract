FROM ubuntu:18.04
ARG GITHUB_TOKEN
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get update && \
    apt-get install -y wget git&& \
    rm -rf /var/lib/apt/lists/*
RUN git config --global url."https://${GITHUB_TOKEN}:@github.com/".insteadOf "https://github.com/"
RUN mkdir /contract
RUN mkdir -p /ton/bin /ton/smartcont /ton/fift/lib /ton/work
COPY --from=it4addict/ton-build /ton/build/crypto/fift /ton/bin
COPY --from=it4addict/ton-build /ton/build/crypto/func /ton/bin
COPY --from=it4addict/ton-build /ton/crypto/fift/lib /ton/fift/lib
COPY --from=it4addict/ton-build /ton/crypto/smartcont /ton/smartcont
ENV FIFTPATH /ton/fift/lib
ENV PATH $PATH:/ton/bin
WORKDIR /contract
RUN git clone https://github.com/tonradar/ton-dice-web-contract .
RUN ./test.sh