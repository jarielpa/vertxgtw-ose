FROM jboss/base-jdk:8

ENV APIMAN_VERSION 1.3.1.Final
ENV JBOSS_HOME /opt/jboss

USER root

RUN mkdir $HOME/vertxgtw && cd $HOME/vertxgtw \
 && curl https://downloads.jboss.org/apiman/$APIMAN_VERSION/apiman-distro-vertx-$APIMAN_VERSION.zip | bsdtar -xvf- \
 && mv $HOME/vertxgtw $JBOSS_HOME

RUN chown -R jboss:0 ${JBOSS_HOME} \
 && chmod -R g+rw ${JBOSS_HOME}

USER jboss

# Set the default command to run on boot
ENTRYPOINT ["/opt/jboss/vertxgtw/apiman-gateway.sh", "--conf=configs/conf-es.json"]

