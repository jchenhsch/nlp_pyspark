#!/bin/bash

# initialize the git repo in pyspark_nlp
# Nov.14th 2023, Jiaxuan Chen

read -p "Enter your GitHub Personal Access Token: " NLP_TOKEN
read -p "Enter the GitHub Repository URL: " REPO_URL

#  switch to Local disk clone the pyspark-nlp project
cd ..
git clone $REPO_URL

# install gcm
curl -L https://aka.ms/gcm/linux-install-source.sh -o gcm-install.sh
cat gcm-install.sh  # Optional, to inspect the script
sh gcm-install.sh

# install gitHub cli repo

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update

# install cli login from the repo for credential caching
sudo apt install gh

# log in GitHub CLI with token
NLP_TOKEN= $NLP_TOKEN
echo $NLP_TOKEN | gh auth login --with-token

if gh auth status; then
    echo "GitHub authentication successful."
    # store the cached key and user
    git config --global credential.helper store
else
    echo "GitHub authentication failed."
    exit 1
fi

# change the working directory to pyspark_nlp
cd pyspark_nlp