##### regular updates
sudo yum install update -y
sudo yum install upgrade -y

##### Install GIT
sudo yum install git.x86_64 -y

#### Install Docker
sudo yum install docker.x86_64 -y
sudo service docker start
#### and docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

