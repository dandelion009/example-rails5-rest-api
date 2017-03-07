# Example RESTful API using Rails 5 in API mode

## Notes

* Webhook calls aren't actually executed, but they will be logged
  in the Rails server output.

* Do NOT use this code for production since the
  application secrets are stored in the repository.

## Running the application using Docker and docker-compose

These instructions are for MacOS.

### Installing required packages using Homebrew

1. `brew cask install virtualbox`
2. `brew install docker docker-compose docker-machine`

### Building and running the application in the background

1. `docker-compose build && docker-compose up -d`
2. `docker-compose run api rails db:setup db:migrate`

### Tailing the logs

`docker-compose logs -f -t`

### Determining the IP address of the API

`docker-machine ip default`

The API will be listening on port 80 inside the Docker container.

### Running the Rails console in the Docker environment

`docker-compose run api rails c`

### Stopping Docker and deleting old local images

`docker-compose down --rmi local`

## Local Development Setup

1. `brew install rbenv rbenv-binstubs ruby-build postgresql`
2. Initialize postgres per instructions.
3. `eval "$(rbenv init -)" && rbenv install 2.4.0 && rbenv local 2.4.0`
4. `gem install rails bundler`
5. `rails db:setup db:migrate`
6. `rails s -d`

### Inspect the available API routes

`rake routes`

## Curl command examples

*NOTE:* Replace `localhost:3000` in the examples below with the correct IP address
if you are running the API in a Docker container.

### Obtain a JSON Web Token (JWT)

`curl -XPOST -H "Content-type: application/json" -d '{"auth": {"email": "admin@example.com", "password": "password"}}' 'http://localhost:3000/user_token'`

Remember to save the token you receive in your response for use below.

### Get a list of brands

`curl -XGET -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" 'http://localhost:3000/brands'`

### Get a specific brand

`curl -XGET -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" 'http://localhost:3000/brands/SOME-BRAND-UUID'`

### Add a new brand

`curl -XPOST -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" -d '{"name": "Acme Towels"}' 'http://localhost:3000/brands'`

### Remove a brand

`curl -XDELETE -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" 'http://localhost:3000/brands/SOME-BRAND-UUID'`

### Get a list of consumers

`curl -XGET -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" 'http://localhost:3000/consumers'`

### Get a specific consumer

`curl -XGET -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" 'http://localhost:3000/consumers/SOME-CONSUMER-UUID'`

### Get a list of brand affinities for a given consumer

`curl -XGET -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" 'http://localhost:3000/consumers/SOME-CONSUMER-UUID/brand_affinities'`

### Add an affinity for one (or more) brands to a consumer

`curl -XPUT -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" -d '{"brand_affinity_ids": [ "SOME-BRAND-UUID", "ANOTHER-BRAND-UUID" ]}' 'http://localhost:3000/consumers/SOME-CONSUMER-UUID'`

### Remove a consumer

`curl -XDELETE -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" 'http://localhost:3000/consumers/SOME-CONSUMER-UUID'`

### Change a brand's list of followers

`curl -XPUT -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" -d '{"follower_ids": [ "SOME-FOLLOWER-UUID", "ANOTHER-FOLLOWER-UUID" ]}' 'http://localhost:3000/brands/SOME-BRAND-UUID'`

### Get a list of webhooks

`curl -XGET -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" 'http://localhost:3000/hooks'`

### Add a new webhook

`curl -XPOST -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" -d '{"threshold": "50", "callback": "https://foo.example.com/bar"}' 'http://localhost:3000/hooks'`

### Remove a webhook

`curl -XDELETE -H 'Authorization: Bearer YOUR_TOKEN_HERE' -H "Content-type: application/json" 'http://localhost:3000/hooks/SOME-WEBHOOK-UUID'`
