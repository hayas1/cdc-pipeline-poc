FROM debezium/connect-base:2.6

RUN mkdir -p /kafka/connect
RUN curl -fsL https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/2.6.2.Final/debezium-connector-mysql-2.6.2.Final-plugin.tar.gz |\
    tar zx -C /kafka/connect
RUN curl -fsL https://repo1.maven.org/maven2/com/wepay/kcbq/kcbq-confluent/1.6.5/kcbq-confluent-1.6.5.zip -o kcbq-confluent-1.6.5.zip &&\
    unzip kcbq-confluent-1.6.5.zip -d /kafka/connect

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
