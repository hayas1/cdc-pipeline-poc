#! /bin/bash -e

# change home directory owner from root
echo "change home directory ${HOME} owner to ${USER}..."
sudo chown -R "${USER}:${USER}" "${HOME}"
echo "done"

# for develop with python
if [ -e "./requirements.txt" ]; then
    pip install -r "./requirements.txt"
fi

# install kafka cli
wget https://dlcdn.apache.org/kafka/3.7.0/kafka_2.13-3.7.0.tgz -P bin
tar -zxvf bin/kafka_2.13-3.7.0.tgz -C bin

# install mysql, postgresql
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y postgresql
sudo apt-get install -y mariadb-client
