[![Stories in Ready](https://badge.waffle.io/keomony/clothes_swapping.png?label=ready&title=Ready)](https://waffle.io/keomony/clothes_swapping)

# Clothes Swapping

<a href="url"><img src="http://clothes-swapping.herokuapp.com/images/logos/logo_25.png" align="top" height="200" width="200" ></a>

Re-cycle Re-clothe Re-wardrobe!

App can be viewed at http://clothes-swapping.herokuapp.com


## Synopsis

A web app for users to exchange clothes with one another. There is no monetization, the app is designed to reduce the waste involved in keeping your wardrobe fresh and on-trend.

## System Dependencies

 * Ruby on Rails 5.0.1
 * bootstrap - styling
 * envyable - environment files
 * dotenv  - environment files
 * simple_form - form formatting
 * devise - user authentication
 * paperclip - file uploading
 * imagemagick - image compression and resizing
 * amazon web services - cloud storage for images

## Installation Instructions

 * Fork and clone this repo
 * brew install imagemagick
 * run `bundle` to install dependencies
 * run `bin/rake db:create` to create local databases
 * run `bin/rake db:migrate` to perform necessary migrations
 * run `rspec` to run the testing suite
 * run `bin/rails s` to start the server
 * visit `http://localhost:3000` to see the app
