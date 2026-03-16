#!/bin/bash

# Deploying and handling errors for Django App

# Writing the function to clone the app. Using a public github repo
clone() {
    echo "Cloning the app..."
    if [[ -d "django-notes-app" ]];
    then
        echo "Directory Already Exists."
    else
        git clone https://github.com/LondheShubham153/django-notes-app.git || {
            echo "Failed to Clone"
            return 1
        }
    fi
}

#Function to install the dependencies
install_dependencies() {
    echo "Installing Dependencies"
    sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose || {
        echo "Failed to install dependencies"
        return 1
    }
}

#Function to perform any required restarts
perform_restarts() {
    echo "Performing restarts..."
    sudo chown "$USER" /var/run/docker.sock || {
        echo "Failed to change ownership of docker.sock."
        return 1
    }

   
    
        sudo systemctl enable docker
        sudo systemctl enable nginx
        sudo systemctl restart docker
   
}

#Function to deploy the Django App
deploy() {
    echo "Deploying..."
    docker build -t notes-app . && docker-compose up -d || {
        echo "Failed to build and deploy the app."
        return 1
    }
}

#Main Script
echo "********** DEPLOYMENT STARTED *********"

# Clone the code
if  clone; then
    cd django-notes-app || exit 1
fi

# Install dependencies
if ! install_dependencies; then
    exit 1
fi

# Perform required restarts
if ! perform_restarts; then
    exit 1
fi

# Deploy the app
if ! deploy; then
    echo "Deployment failed. Mailing the admin..."
    # Add your sendmail or notification logic here
    exit 1
fi

echo "********** DEPLOYMENT DONE *********"