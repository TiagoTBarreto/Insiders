# variable
data=$(date +'%Y-%m-%dT%H:%M:%S')
path='/home/tiagobarreto/DS/repos/clusterização/pa005_clustering'
path_to_envs='/home/tiagobarreto/.pyenv/versions/3.11.4/envs/cluster/bin'

$path_to_envs/papermill $path/src/models/ciclo10-deploy.ipynb $path/reports/ciclo10-deploy_$data.ipynb 
