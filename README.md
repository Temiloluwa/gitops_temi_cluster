# GitOps Temi's Cluster

This GitOps Repo facilitates the continuous deployment of my AI and ML apps. <br>
The cluster is deployed using Terraform configurations in the `IAC` folder. <br>
Deployed applications are found in the `Manifests` folder

## Cluster Setup


- **Number of Manager Nodes**: 1
- **Number of Worker Nodes**: 3
- **Cloud Platform**: AWS
- **Cluster**: [https://cluster.hifeyinc.com](https://cluster.hifeyinc.com)

### Cluster Workers
1. Business Node - Containers container business logic are hosted here
2. Airflow Node - Dedicated node to deploy airflow
3. Development Node - Dedicated node for development in the cloud using code-server

## Demo Apps

Some Demo apps are present in this repo to experiment with some functionalities

1. Making RPC calls using AMQP in a microservice architectural setup



## Technologies

|S/N  | Technology  |Purpose|  
|---|---|---|
| 1  | ![](./assets/imgs/terraform.jpg) Terraform| IAC   |
| 2  | ![](./assets/imgs/gitlab.jpg) Gitlab| Continuous Integration   |
| 3  | ![](./assets/imgs/portainer.jpg) Portainer  | Container Management and Continous Deployment   |
| 4  | ![](./assets/imgs/npm.jpg) Ngnix Proxy Manager  | Reverse Proxy   |
| 5  | ![](./assets/imgs/streamlit.jpg) Streamlit  | Frontend  |
| 6  | ![](./assets/imgs/fastapi.jpeg) FastAPI  | Api   |
| 7  | Airflow  | Pipeline Orchestrator   |
| 8  |  NextJS  | Frontend   |
| 9  |  RabbitMQ  | AMQP Broker   |


## Deployed Applications

|S/N  | Code  | Application |
|---|---|---|
| 1  | [Streamlit Apps](https://github.com/Temiloluwa/large-language-model-apps/tree/main/streamlit_apps)| https://app.hifeyinc.com |



