[![Build status](https://dev.azure.com/yfouillet/Docker-hub/_apis/build/status/devops-automation-tools)](https://dev.azure.com/yfouillet/Docker-hub/_build/latest?definitionId=2) [![](https://images.microbadger.com/badges/version/yfouillet/devops-automation-tools.svg)](https://microbadger.com/images/yfouillet/devops-automation-tools "Get your own version badge on microbadger.com")


# devops-automation-tools

DevOps automation Tools Docker Images built on Alpine Linux

- Ansible (with jinja2) : 2.7.9
- Ansible LINT : 3.4.23
- Terraform : 0.11.8
- Packer : 1.2.4

#### Start image in Docker with Linux shell

```
docker run --rm -it -h localhost -v $(pwd):/workspace yfouillet/devops-automation-tools
```

### :warning: Warning for Windows, it is necessary to authorise access in windows directory :warning:

### For a personal computer (enable the drive mapping in Docker ) :
=> Docker Settings -> Shared Drives -> Check the drive necessary -> apply

### For a professional computer (share directory for use it) :
=> Right click in directory => Settings -> Share -> Share -> add

#### Start image in Docker with Windows command line (DOS)

```
docker run --rm -it -h localhost -v %CD%\:/workspace -w /workspace yfouillet/devops-automation-tools
```
#### Start image in Docker with Windows Powershell

```
docker run --rm -it -h localhost -v $PWD\:/workspace -w /workspace yfouillet/devops-automation-tools
```
