# README

### Getting started: 

Clone this Repo

cd into repo

run `docker-compose build`

run `docker-compose run tracker rake db:migrate:reset`

run `docker-compose up`

### General Routes:

/users is list of all users

/drinks is a list of all drinks

/containers is going to be a list of container with specific sizes to add to users total volume

each user has many drinks of some volume
