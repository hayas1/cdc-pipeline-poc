FROM debezium/connect-base:2.6

RUN mkdir -p $KAFKA_CONNECT_PLUGINS_DIR # /kafka/connect
RUN curl -fsL https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/2.6.2.Final/debezium-connector-mysql-2.6.2.Final-plugin.tar.gz |\
    tar zx -C $KAFKA_CONNECT_PLUGINS_DIR
RUN mkdir -p /kafka/confluent-hub-client &&\
    curl -fsL http://client.hub.confluent.io/confluent-hub-client-latest.tar.gz | tar zx -C /kafka/confluent-hub-client &&\
    yes | /kafka/confluent-hub-client/bin/confluent-hub install wepay/kafka-connect-bigquery:2.5.6 --component-dir $KAFKA_CONNECT_PLUGINS_DIR || true

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
