Example of Docker Compose
=============

This repo shows an example of typical architecture of proxy + load balancing with **apache web server** and **tomcat** made with **docker-compose**.

## Running

Clone the repo and cd inside

        docker-compose up -d

## Testing

        docker-compose ps

It will show the active containers

        curl http://localhost/examples

will show that tomcat is responding

## Useful commands

`docker-compose stop` will stop all containers
`docker-compose start` will start the containers again
`docker-compose down` will stop and remove all containers (with flag `--rmi all` also it will delete images).

## Tips

You must use environment variables to the config files for the load balancer works succesfully
