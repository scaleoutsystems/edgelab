# EdgeLab

Todos
- [x] Base image creation
- [x] Base service startup scripts
- [x] Deploy and configure service
- [x] Replace fedn-network reducer url with vars.
- [x] Invoke dataset fetcher on deployment.

> Running federated clients on Nvidia Xavier AGX
## Running ansible playbooks
1. Prepare your hostsfile
```bash
$ vi hosts
```
example hostsfile:

```txt
127.0.0.1
127.0.0.2
127.0.0.3
```
2. Test the playbook
```bash
$ ansible-playbook -i hosts agx-setup.yaml --check
```
3. Run the playbook
```bash
$ ansible-playbook -i hosts agx-setup.yaml
```

4. Control remote clients
```bash
$ ansible-playbook -i hosts agx-stop.yaml
```
```bash
$ ansible-playbook -i hosts agx-start.yaml
```


**Remark**
This images uses CUDA 10.2.
The images cuda version must reflect runtime on host configured with "nvidia-docker"

> Running federated control plane on VM's

## Docker image for AGX

### How to build the image
Building images from a host with binaryfmt crosscompile capabiliies
Check your host for capabilties
```bash
$ docker buildx ls
```
Ensure your system can build linux/arm64

```bash
$ docker buildx build --platform linux/arm64 -t YOUR/TAGS:HERE .
```
to build a specific version select the dockerfile respectively
```bash
$ docker builx build --platform linux/arm64 -f Dockerfile.sklearn -t YOUR/TAGS:HERE .
```

When image is built push to YOUR registry.
```bash
$ docker push YOUR/TAGS:HERE
```

### Use pre-built image from scaleout repository

```bash
$ docker pull scaleoutsystems/agx:latest
```

```bash
$ docker pull scaleoutsystems/agx:sklearn
```


### Running manually

```bash
$ nvidia-docker run -it -v $(pwd):/app scaleoutsystems/agx:sklearn fedn run client -in fedn-network.yaml
