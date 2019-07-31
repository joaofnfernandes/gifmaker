# Make gifs and videos from image frames 

If you only have png images, add them in alphabetical order to `./images` and run:

```
docker-compose up
```

If you want to customize things a bit more:

```
docker-compose build
docker run -it -v $(pwd)/images:/images jff/gifmaker:latest img_a.png image_b.png ...
```