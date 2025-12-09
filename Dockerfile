FROM jenkins/jenkins:2.528.2-jdk21

ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY setup.groovy /var/jenkins_home/init.groovy
RUN jenkins-plugin-cli \
  --jenkins-update-center='https://azure.updates.jenkins.io/update-center.json' \
  --jenkins-plugin-info='https://azure.updates.jenkins.io/plugin-versions.json' \
  --plugin-file /usr/share/jenkins/ref/plugins.txt \
  --verbose

