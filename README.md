# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* 


docker compose build

docker compose run --rm web rails db:create

docker compose up

docker-compose exec web bash

* Loto6 fetch_recommended_numbers

LotoSixNumber.fetch_recommended_numbers 1755(lottery_id)
LotoSixNumber.fetch_recommended_numbers 1755, past_number: 10, occurrences: [3,4,5,6,7,8,9,10]
