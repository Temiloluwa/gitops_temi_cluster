# Create a new Profile
1. Create a Profile manifest as in **kf-david-profile.yaml** and run **kubectl apply -f <manifest.yaml>***
2. Update dex config
    - export dex config map using **kubectl get configmap dex -n auth -o yaml > config.yaml**
    - update the array data.config.yaml.staticPasswords as follows:
        ```yaml
            - email: <same email as your profile>
              hash: <generate a bcrypt password using: python3 -c 'from passlib.hash import bcrypt; import getpass; print(bcrypt.using(rounds=12, ident="2y").hash(getpass.getpass()))'>
              username: <your new username>  
        ```
    - apply the new config **kubectl apply -f config.yaml**
    - restart the dex pod: **kubectl rollout restart deployment dex -n auth**