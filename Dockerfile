FROM svanosselaer/ansible-ubuntu:14.04
MAINTAINER Sean Van Osselaer <svo@qual.is>

ADD . /provisioning

RUN ansible-playbook provisioning/playbook.yml && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /provisioning

ADD mongodb.conf /etc/supervisor/conf.d/

EXPOSE 27017
