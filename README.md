# pATLAS-compose
Repository for [pATLAS](www.patlas.site) docker-compose recipe! This
compose currently supports 
[pATLAS version 1.6.0](https://github.com/tiagofilipe12/pATLAS/releases/tag/1.6.0).

## Requirements

- [docker](https://docs.docker.com/install/#supported-platforms)
- [docker-compose](https://docs.docker.com/compose/install/)

## How to use?

- Clone the repository
- Enter the *patlas-compose* folder
- Type `docker-compose up`
- Wait for the line `* Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
` to show up, meaning that the service is now running.
- Access on `127.0.0.1:5000`
- Enjoy!

## How to stop it?

- Enter the *patlas-compose* folder
- Type `docker-compose down`
