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
docker run -v $(pwd):/app -w /app ionic-build-environment npm install
docker run -v $(pwd):/app -w /app ionic-build-environment ionic cordova build android
```
