# polynote-docker

## Dockerfile

- Creates a docker based on Ubuntu 

- Downloads a series of basic packages (will add more in future) for Data Scientists

- Installs spark with hadoop (for version see the ENV variable in Dockerfile) 

- Installs Polynote (for version see the ENV variable in Dockerfile)

- Exposes basic port 8888 for jupyter, 4040 for spark, and 8192 for polynote

- ENTRYPOINT executes the polynote server

## docker-compose.yml

- Associates the mynotebooks folder to notebook folder in docker

- Matches the docker ports to the local ports

## TODO:

- Remove old commands already commented

- Comment more the basic files

- Add more packages

- Change file name in docker-compose.yml
