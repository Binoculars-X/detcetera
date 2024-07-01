# detcetera

# to run locally
docker build --tag 'd7' .     
docker run --rm -it --gpus all -p 7777:7777 -e JUPYTER_TOKEN=211 -v .\ml:/app d7
