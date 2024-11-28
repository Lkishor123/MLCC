# MLCC
This Project contains a POC made using MC2

### Steps to Install Docker:

1. `chmod +x install_docker.sh`
2. `./install_docker.sh`
3. `newgrp docker`


### Steps to Build Docker image:

1. `git submodule update --init --recursive`
2. `cd submodule/mc2`
3. `sudo docker build -t mc2_img .` \m 

sudo docker pull mc2project/mc2_img:v0.1.3
sudo docker run -d -it -v $(pwd)/client/playground:/mc2/client/playground 1a21716f0c54 /bin/bash