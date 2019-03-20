[![Build status](https://dev.azure.com/yfouillet/Docker-hub/_apis/build/status/devops-automation-tools)](https://dev.azure.com/yfouillet/Docker-hub/_build/latest?definitionId=2) ![Docker Stars](https://img.shields.io/docker/stars/yfouillet/devops-automation-tools.svg) [![](https://images.microbadger.com/badges/image/yfouillet/devops-automation-tools.svg)](https://microbadger.com/images/yfouillet/devops-automation-tools "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/yfouillet/devops-automation-tools.svg)](https://microbadger.com/images/yfouillet/devops-automation-tools "Get your own version badge on microbadger.com") 



# devops-automation-tools

DevOps automation Tools Docker Images built on Alpine Linux

### Start image in Docker with Linux shell

```
docker run --rm -it -h localhost -v $(pwd):/workspace yfouillet/devops-automation-tools
```

### Start image in Docker with Windows command line (DOS)

```
docker run --rm -it -h localhost -v %CD%\:/workspace -w /workspace yfouillet/devops-automation-tools
```
### Start image in Docker with Windows Powershell

```
docker run --rm -it -h localhost -v $PWD\:/workspace -w /workspace yfouillet/devops-automation-tools
```
