FROM jboss/base-jdk:8

ENV APIMAN_VERSION 1.3.1.Final
ENV JBOSS_HOME /opt/jboss

USER root

RUN mkdir $HOME/vertxgtw && cd $HOME/vertxgtw \
 && curl https://downloads.jboss.org/apiman/$APIMAN_VERSION/apiman-distro-vertx-$APIMAN_VERSION.zip | bsdtar -xvf- \
 && mv $HOME/vertxgtw/apiman-distro-vertx-$APIMAN_VERSION $JBOSS_HOME/vertxgtw

COPY ./configs/conf-es.json ${JBOSS_HOME}/vertxgtw/configs

RUN chown -R jboss:0 ${JBOSS_HOME} \
 && chmod -R g+rw ${JBOSS_HOME} \
 && chmod -R 755 ${JBOSS_HOME}/vertxgtw/*.sh

USER jboss

WORKDIR ${JBOSS_HOME}/vertxgtw

# Set the default command to run on boot
CMD ["/opt/jboss/vertxgtw/apiman-gateway.sh",  "--conf=/opt/jboss/vertxgtw/configs/conf-es.json"]

