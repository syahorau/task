FROM ubuntu:24.04
RUN apt update && apt install -y openssh-server python3 sudo && \
sed -i 's/.PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
useradd -m -s /bin/bash test  && \
echo "test:test" | chpasswd && \
echo "test ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/test
EXPOSE 22
ENTRYPOINT service ssh start && sleep 6h
