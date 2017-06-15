# Blog Application

## Technologies used:
- ruby 2.4.1
- rails 5.1.1

## Details
This is an api that communicates in JSON to get and post data from front end app or mobile app.
This app work as a blog for a singlle user and other users can comment on articles and follow blog to get updates

## Usage
- First clone the repo
- then make `config/secrets.yml` with help of `config/secrets.example.yml` according to your system's config
- then make `config/database.yml` with help of `config/database.example.yml` according to your system's config
- then make `config/cable.yml` with help of `config/cable.example.yml` according to your system's config
- then make `config/constants.yml` with help of `config/constants.example.yml` according to your system's config
- then run `rails db:create`
- then run `rails db:migrate`
- Finally run `rails s` and your app will be available at [http://localhost:3000](http://localhost:3000)

