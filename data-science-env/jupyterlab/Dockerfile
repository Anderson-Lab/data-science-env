FROM python:3.6

RUN apt-get update
RUN apt-get -y install zip

# Install Jupyter
RUN pip install jupyter
RUN pip install ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension

# Install JupyterLab
RUN pip install jupyterlab && jupyter serverextension enable --py jupyterlab

RUN pip install graphviz \
                --no-cache-dir \
                --no-dependencies

RUN pip install pymongo

# Install Python Packages & Requirements (Done near end to avoid invalidating cache)
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN pip install dask distributed --upgrade

RUN pip install kaggle

RUN pip install missingno

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

RUN pip install lightgbm

RUN jupyter labextension install @jupyterlab/plotly-extension

#ENV GUROBI_INSTALL /opt/gurobi752
#ENV GUROBI_HOME $GUROBI_INSTALL/linux64
#ENV PATH $PATH:$GUROBI_HOME/bin
#ENV LD_LIBRARY_PATH ${GUROBI_HOME}/lib

#COPY gurobi.lic /root/gurobi.lic

#RUN wget https://packages.gurobi.com/7.5/gurobi7.5.2_linux64.tar.gz -O gurobi.tar.gz
#RUN tar xfvz gurobi.tar.gz -C /opt
#RUN cd /opt/gurobi752/linux64 && python setup.py install

RUN apt-get install -y vim

RUN usermod --shell /bin/bash root

# Dumb init
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64
RUN chmod +x /usr/local/bin/dumb-init

COPY prepare.sh /usr/bin/prepare.sh
RUN chmod +x /usr/bin/prepare.sh

# Expose Jupyter port & cmd
RUN mkdir -p /opt/app/data
#ENV BASEURL nobaseurl
#CMD export SHELL=/bin/bash && jupyter lab --LabApp.base_url=$BASEURL --ip=0.0.0.0 --port=8888 --no-browser --notebook-dir=/opt/app/data --allow-root

ENTRYPOINT ["/usr/local/bin/dumb-init", "/usr/bin/prepare.sh"]
