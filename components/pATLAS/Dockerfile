FROM ubuntu:16.04
MAINTAINER Bruno Gonçalves <bfgoncalves@medicina.ulisboa.pt>

# Create pATLAS folder
WORKDIR /pATLAS/

# Install general dependencies
RUN apt-get update && apt-get install -y git curl sudo gcc g++ make \
                                software-properties-common python-software-properties \
                                postgresql postgresql-contrib wget
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y yarn python3.6 python3-pip build-essential tcl libssl-dev libffi-dev python3.6-dev

# Install pipenv
RUN pip3 install pipenv

# Clone flowcraft-webapp
WORKDIR /pATLAS/
RUN git clone https://github.com/tiagofilipe12/pATLAS

WORKDIR /pATLAS/pATLAS/patlas/db_manager/db_app/static/
RUN yarn install

RUN node_modules/webpack/bin/webpack.js entry-point.js

WORKDIR /pATLAS/pATLAS/patlas/db_manager

# Get and extract pATLAS db
# Release 1.5.2
RUN wget https://github.com/tiagofilipe12/pATLAS/releases/download/1.5.2/plasmid_db_dev_final.tar.gz
RUN tar xf plasmid_db_dev_final.tar.gz
RUN rm plasmid_db_dev_final.tar.gz

# Install Backend dependencies
WORKDIR /pATLAS/pATLAS/
RUN pip install -r requirements.txt

# Set final WORKDIR
WORKDIR /pATLAS/pATLAS/patlas/db_manager

# Set required changes on db configuration file and patlas service starting script
COPY db_config.py config_default.py
COPY run.py run.py
RUN chmod +x run.py

# Copy entrypoint for patlas to the image
COPY patlas_entrypoint.sh patlas_entrypoint.sh
RUN chmod +x patlas_entrypoint.sh

ENTRYPOINT ["/pATLAS/pATLAS/patlas/db_manager/patlas_entrypoint.sh"]
