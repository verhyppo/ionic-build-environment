# ionic-build-environment


## How to create your image to build

```
docker build -t 'ionic-build-environment' .
```

## How to build you project

> add a .dockerignore file in your project excluding node_modules from the build.
> e.g.
> ```
> echo "node_modules" >> .dockerignore
> ```
```
#run the container
docker run -it -name=ionic -v $(pwd):/app -w /app ionic-build-environment /bin/bash
docker exec -it ionic npm install
docker exec -it ionic npm install ionic cordova build android
```
