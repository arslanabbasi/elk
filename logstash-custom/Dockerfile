FROM docker.elastic.co/logstash/logstash:6.2.4
COPY entrypoint.sh /entrypoint.sh
USER root
RUN chmod +x /entrypoint.sh
USER logstash
ENTRYPOINT ["/entrypoint.sh"]
#RUN rm -f /usr/share/logstash/pipeline/logstash.conf
#ADD pipeline/ /usr/share/logstash/pipeline/
#ADD config/ /usr/share/logstash/config/
