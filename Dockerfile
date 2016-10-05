FROM andrewosh/binder-base:latest

# RUN mkdir /home/main/notebooks
# RUN chown main:main /home/main/notebooks
WORKDIR /home/main/notebooks
USER root
# COPY . /home/main/notebooks/
# RUN chown -R main:main $HOME/notebooks
USER main

RUN find $HOME/notebooks -name '*.ipynb' -exec jupyter trust {} \;

ADD requirements.txt requirements.txt
ADD handle-requirements.py handle-requirements.py
RUN python handle-requirements.py

USER root
RUN apt-get install libblas-dev liblapack-dev libatlas-base-dev gfortran
RUN pip install CVXOPT

USER main
WORKDIR $HOME/notebooks
