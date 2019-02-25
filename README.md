# ionic-build-environment


## How to create your image to build

```
docker build -t 'ionic-build-environment' .
```

## How to build you project

```
#run the container is the quickest solution
docker run -it --rm --name=ionic -v $(pwd):/app -w /app ionic-build-environment /bin/bash
docker exec -it ionic npm install
docker exec -it ionic npm rebuild node-sass 
docker exec -it ionic ionic cordova build android
```
