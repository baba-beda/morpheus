FROM opencpu/base
RUN \
    apt-get -y update && \
    apt-get -y install git && \
    sed -i 's/"rlimit.nproc":.*/"rlimit.nproc": 100,/' /etc/opencpu/server.conf && \
    R -e 'source("https://bioconductor.org/biocLite.R"); library(devtools); install_github("baba-beda/morpheusR")' && \
    apt-get -y install libcairo2-dev && \
    apt-get -y install libxt-dev && \
    cd /var/www/html && \
    git clone https://github.com/baba-beda/morpheus.js.git morpheus && \
    cd
