USER root
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    libblas-dev \
    liblapack-dev \
    libatlas-base-dev \
    gfortran

RUN conda remove libgfortran
RUN conda install libgcc --force

RUN pip install CVXOPT
RUN pip install mosek

USER main

