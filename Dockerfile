FROM nikeda/tabular_analytics:latest
LABEL maintainer="Naoya Ikeda <n_ikeda@hotmail.com>"
RUN echo "now building..."
RUN apt install -y lsb-release build-essential libssl-dev libc6-dev libicu-dev apt-file
RUN R -e "install.packages('V8',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('huge',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('Matrix',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('lme4',dependencies=TRUE, repos='http://cran.rstudio.com')"
RUN R -e "install.packages('h2o',dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('BiocManager',dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "BiocManager::install(c('graph', 'RBGL'))" 
RUN R -e "install.packages('dlm',dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('KFAS',dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('bsts',dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('BNSL',dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('pcalg',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('CausalImpact',dependencies=TRUE, repos='http://cran.rstudio.com/')"

RUN ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    wget https://github.com/unicode-org/icu/archive/release-58-3.tar.gz && \
    tar xvzf release-58-3.tar.gz && \
    cd icu-release-58-3/icu4c/source && \
    ./configure && \
    make && \
    make install && \
    ldconfig /etc/ld.so.conf.d
