# ionic-build-environment


## How to create your image to build

```
docker build -t 'ionic-build-environment' [--build-arg GRADLE_VERSION=gradle-5.2.1] [--build-arg ANDROID_BUILD_TOOLS_VERSION=27.0.3 ] [--build-arg ANDROID_VERSION=27] .
```

## How to build you project

```
#run the container is the quickest solution
docker run -d -it --rm --name=ionic -v $(pwd):/app -w /app ionic-build-environment /bin/bash
docker exec -it ionic ionic cordova build android
```

otherwise, you can run the container directly in order to build the application:
```
docker run -it -v $(pwd):/app -w /app ionic-build-environment ionic corcova build android
```
