FROM opencpu/base
RUN apt-get -y update
RUN apt-get -y install git
RUN sed -i 's/"rlimit.nproc":.*/"rlimit.nproc": 100,/' /etc/opencpu/server.conf
RUN apt-get -y install libcairo2-dev
RUN apt-get -y install libxt-dev
RUN R -e 'source("https://bioconductor.org/biocLite.R"); biocLite("Biobase"); library(devtools); install_github("baba-beda/morpheusR"); install_github("hadley/scales")'
RUN cd /var/www/html && \
    git clone https://github.com/baba-beda/morpheus.js.git morpheus && \
    cd
