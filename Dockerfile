FROM alejandrofcarrera/phusion.python
MAINTAINER Fernando Serena <fernando.serena@centeropenmiddleware.com>

ENV HOME /usr/lib/metrics

# Create directories & virtual env for the Planner
RUN virtualenv $HOME/.env
WORKDIR /usr/lib/metrics
RUN .env/bin/pip install SPARQLWrapper==1.7.2
RUN .env/bin/pip install SDH-CI-Metrics

# Configure runit
ADD ./my_init.d/ /etc/my_init.d/
ONBUILD ADD ./my_init.d/ /etc/my_init.d/

CMD ["/sbin/my_init"]

VOLUME ["/usr/lib/metrics"]
EXPOSE 5003
