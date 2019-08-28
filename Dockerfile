FROM nikeda/tabular_analytics:0.0.12
LABEL maintainer="Naoya Ikeda <n_ikeda@hotmail.com>"
RUN echo "now building..."
RUN pip install optuna

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

