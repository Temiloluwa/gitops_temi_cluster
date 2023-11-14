# Local Dev Environment Setup

Local dev environment is setup using Ubuntu Multipass

## Steps
1. Download latest version of Multipass @ [Multipass Link](https://multipass.run/docs/installing-on-windows)
2. Create two servers, one master and one worker
    ``` bash

    # check ubuntu versions
    multipass find

    # launch master with jammy (alias for ubuntu 22.04)
    multipass launch jammy --name hyc-dev-master --cpus 2 --memory 1G --disk 15G
    multipass launch jammy --name hyc-dev-worker --cpus 2 --memory 9G --disk 60G
    
    ```

3. Login into servers

    ```bash

    # log into master
    multipass shell hyc-dev-master

    # log into worker
    multipass shell hyc-dev-worker
    ```

4. [Install Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)