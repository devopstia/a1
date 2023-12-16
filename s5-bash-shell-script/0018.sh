
#!/bin/bash
​

# ubuntu = Ubuntu
# redhat = Red Hat Enterprise Linux
# centos = CentOS Linux
# amazon-ec2 = Amazon Linux

OS_NAME=$(cat /etc/*release |grep -w NAME |awk -F'"' '{print$2}')

function yum_os {
  echo "This is $OS_NAME OS"
  sleep 5
  yum update -y 
}

function apt_os {
    echo "This is $OS_NAME OS"
    sleep 5
    # List of packages to install
    packages=(
        curl 
        wget 
        vim 
        git 
        make 
        ansible 
        python3-pip 
        openssl 
        rsync 
        jq 
        postgresql-client 
        mariadb-client 
        mysql-client 
        unzip 
        tree 
    )

    # Update package list
    sudo apt update -y

    # Install packages
    for package in "${packages[@]}"; do
        echo "Installing $package Please wait ................."
        sleep 3
        sudo apt install -y "$package"
    done
    echo "Package installation completed."
}


function yum_os {
    echo "This is $OS_NAME OS"
    sleep 5
    # List of packages to install
    packages=(
        curl 
        wget 
        vim 
        git 
        make 
        ansible 
        python3 python3-pip 
        openssl 
        rsync 
        jq 
        postgresql-client 
        mariadb-client 
        mysql-client 
        openjdk-11-jdk
        unzip 
        tree 
    )

    # Update package list
    sudo yum update -y

    # Install packages
    for package in "${packages[@]}"; do
        echo "Installing $package Please wait ................."
        sleep 3
        sudo yum install -y "$package"
    done
    echo "Package installation completed."
}

function apt_software {
    ## Install aws cli
    which aws
    if [ "$?" -eq 0 ]; then
        echo "AWS ClI is intalled already. Noting to do"
    else
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        sudo ./aws/install
        rm -rf awscliv2.zip
        rm -rf aws
    fi

    ## Terraform version 1.0.0
    ## https://releases.hashicorp.com/terraform/
    TERRAFORM_VERSION="1.0.0"
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    mv terraform /usr/local/bin/
    terraform --version
    rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip

    ## Install grype
    ## https://github.com/anchore/grype/releases
    GRYPE_VERSION="0.66.0"
    wget https://github.com/anchore/grype/releases/download/v${GRYPE_VERSION}/grype_${GRYPE_VERSION}_linux_amd64.tar.gz
    tar -xzf grype_${GRYPE_VERSION}_linux_amd64.tar.gz
    chmod +x grype
    sudo mv grype /usr/local/bin/
    grype version

    ## Install Gradle
    ## https://gradle.org/releases/
    GRADLE_VERSION="4.10"
    sudo apt install openjdk-11-jdk -y
    wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
    unzip gradle-${GRADLE_VERSION}-bin.zip
    mv gradle-${GRADLE_VERSION} /opt/gradle-${GRADLE_VERSION}
    /opt/gradle-${GRADLE_VERSION}/bin/gradle --version

    ## Install kubectl
    sudo curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/kubectl 
    sudo chmod +x ./kubectl 
    sudo mv kubectl /usr/local/bin/

    ## INSTALL KUBECTX AND KUBENS
    sudo wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx 
    sudo wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens 
    sudo chmod +x kubectx kubens 
    sudo mv kubens kubectx /usr/local/bin

    ## Install Helm 3
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    sudo  chmod 700 get_helm.sh
    sudo ./get_helm.sh
    sudo helm version

    ## Install Docker Coompose
    # https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version

    ### TERRAGRUNT INSTALLATIN
    # https://terragrunt.gruntwork.io/docs/getting-started/supported-terraform-versions/
    TERRAGRUNT_VERSION="v0.38.0"
    sudo wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 
    sudo mv terragrunt_linux_amd64 terragrunt 
    sudo chmod u+x terragrunt 
    sudo mv terragrunt /usr/local/bin/terragrunt
    terragrunt --version

    ## Install Packer
    # https://developer.hashicorp.com/packer/downloads
    sudo wget https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_linux_amd64.zip -P /tmp
    sudo unzip /tmp/packer_1.7.4_linux_amd64.zip -d /usr/local/bin
    chmod +x /usr/local/bin/packer
    packer --version

    ## Install Docker
    # https://docs.docker.com/engine/install/ubuntu/
    sudo apt-get remove docker docker-engine docker.io containerd runc -y
    sudo apt-get update
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    sudo apt-get update
    sudo apt install docker-ce docker-ce-cli containerd.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
}


if [[ $OS_NAME == "Red Hat Enterprise Linux" ]] || [[ $OS_NAME == "CentOS Linux" ]] || [[ $OS_NAME == "Amazon Linux" ]] 
then
    yum_os
elif [[ $OS_NAME == "Ubuntu" ]] 
then
    apt_os
    apt_software
else
    echo "HUMMMMMMMMMM. I don't know this OS"
    exit
fi
