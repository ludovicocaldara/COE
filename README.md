# COE
Common Oracle Environment for Linux

## Installation instructions for the Oracle Cloud Infrastructure (Oracle Linux 6)
```
# Enable the Public Yum repository
cd /etc/yum.repos.d
sudo wget http://yum.oracle.com/public-yum-ol6.repo

# Install git (needed just to download the repo, you might want to find another way to copy it)
sudo yum install git

# Install rlwrap (used extensively, although optional)
sudo yum install rlwrap

# Connect as oracle
sudo su - oracle

# Clone this repository
git clone https://github.com/ludovicocaldara/COE.git

# Enable the profile scripts
echo ". ~/COE/profile.sh" >> $HOME/.bash_profile

# Load the new profile
. ~/.bash_profile
```
