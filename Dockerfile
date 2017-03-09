FROM ubuntu

RUN apt-get update && \
    apt-get install jq \
                    git \
                    nmap \
                    ruby -y && \
    gem install whois

# Download Battalion
RUN git clone https://github.com/theabraxas/Battalion.git
RUN cd /Battalion && ./download-tools.sh

# Setting up python
RUN apt-get update && \
    apt-get install python3 python3-pip -y

# Setting up dnsrecon
RUN cd /Battalion/tools/dnsrecon && \
    pip3 install -r requirements.txt

# Setting up EyeWitness
RUN cd /Battalion/tools/EyeWitness/setup && ./setup.sh

# setting up theHarvester
RUN chmod +x /Battalion/tools/theHarvester/theHarvester.py && \
    pip install requests

# Setup wpscan
RUN apt-get update && \
    apt-get install libcurl4-openssl-dev \
                    libxml2 \
                    libxml2-dev \
                    libxslt1-dev \
                    ruby-dev \
                    build-essential \
                    libgmp-dev \
                    zlib1g-dev -y  && \
    gem install bundler
RUN cd /Battalion/tools/wpscan && \
    bundle install --quiet && \
    unzip -o data.zip
