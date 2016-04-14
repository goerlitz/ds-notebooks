# start jupyter notebook (port 8888, name 'jupyter', mount . as ~/work)
sudo docker run -d -p 8888:8888 --name jupyter -v $(pwd):/home/jovyan/work jupyter/all-spark-notebook
