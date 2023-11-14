# Local Dev Environment Setup

Local dev environment is setup using Ubuntu Multipass

## Steps
1. Download latest version of Multipass @ [Multipass Link](https://multipass.run/docs/installing-on-windows)
2. Create dev server
    ``` bash

    # check ubuntu versions
    multipass find

    # launch master with jammy (alias for ubuntu 22.04)
    multipass launch jammy --name hyc-dev --cpus 4 --memory 16G --disk 60G
    ```

3. Login into servers

    ```bash

    # log into master
    multipass shell hyc-dev

    ```

4. [Install Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
5.  Install docker Swarm, Portainer and Deploy Swarm Cluster