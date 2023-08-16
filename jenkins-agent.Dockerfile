FROM jenkins/ssh-agent
USER root
RUN apt-get update && apt-get install curl lsb-release -y && curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg && echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && apt-get update && apt-get install -y docker-ce

RUN usermod -aG docker jenkins && usermod -aG daemon jenkins

