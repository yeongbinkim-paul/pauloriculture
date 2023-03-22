docker build -t pauloriculture:1.0 -f ./customized.Dockerfile .;
docker run --rm -it \
    -v /Users/gim-yeongbin/paulayground/pauloriculture:/quartz \
    -p 1313:1313 \
    --name pauloriculture \
    pauloriculture:1.0;
