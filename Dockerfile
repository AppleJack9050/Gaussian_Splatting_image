FROM applejack9050678/gaussian_test:cuda11.8_miniconda

RUN apt-get install -y colmap
RUN git clone --recursive https://github.com/graphdeco-inria/gaussian-splatting /app/gaussian-splatting
WORKDIR /app/gaussian-splatting
RUN conda env create --file environment.yml

# ==================================================================
# Startup
# ------------------------------------------------------------------
EXPOSE 8888 6006

CMD jupyter lab --allow-root --ip=0.0.0.0 --no-browser --ServerApp.trust_xheaders=True --ServerApp.disable_check_xsrf=False --ServerApp.allow_remote_access=True --ServerApp.allow_origin='*' --ServerApp.allow_credentials=True