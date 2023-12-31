FROM confluentinc/cp-kafka-connect:7.2.2

#If you want to run a local build of the connector, uncomment the COPY command and make sure the JAR file is in the directory path
#COPY mongo-kafka-connect-<<INSERT BUILD HERE>>3-all.jar /usr/share/confluent-hub-components 

# install connector addons from confluent hub
RUN confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:1.8.0
RUN confluent-hub install --no-prompt debezium/debezium-connector-postgresql:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.7.4

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components"