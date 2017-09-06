# Chatty Chatbot


## Synopsis

The Chatty Chatbot is a single page user facing app where you can have a heart to heart chat with a bot or just ask him to quizz you on importnat matters like cartoons.
You can chat with Chatty [here][1].

## User stories

**As a user**,

So I can let the bot know I want to chat,  
I want to say Hello to him

So I know that it wants to chat with me,   
I want him to reply back with a message

So I can chose my next message,  
I want to have a few response options I can choose from

So I can reply,  
I want to click on the response I chose

So the bot knows my answer,  
I want my response to be sent to the bot

**As an admin**,

So I know what messages are pre-recorded,   
I want to be able to see all of them on one page

So I can update the messages,  
I want to be able to create a new one, see, update and delete an old one

So I know what responses are pre-recorded,  
I want to see all responses a message can have

So I can update the responses,  
I want to be able to create a new one, see, update and delete an old one


## Built

Built using JavaScript and jQuery for the single page user facing app and Ruby on Rails for the admin backend.
Tested using Rspec and Capybara.

## Installation

Clone this repo and run:  
`bundle install`  
`rake db:create`  
`rake db:migrate`  
To run tests use:  
`rspec`

To run it locally use `rails s` and visit the localhost path mentioned in the startup description. Running the app locally means there are no pre-recorded messages. To add messages and answers click on the Admin button and you'll be re-directed to the admin page.

Or you can visit the live app on [Heroku][1] where there are chat/quizzes examples in the db.  



[1]: https://chatty-chatbot.herokuapp.com/
