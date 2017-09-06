# Chatty Chatbot

## Synopsis

The Chatty Chatbot is a single page user facing app where you can have a heart to heart chat with a bot or just ask him to quiz you on important matters like cartoons.
You can chat with Chatty [here][1] (heroku app).

To access the admin section use user = "Homer" and password="S1mps0n". I used HTTP Basic authentication.

![id](https://raw.githubusercontent.com/corina/chatty-chatbot/master/public/images/Screen%20Shot.png)

## Built

Built using JavaScript and jQuery for the single page user facing app and Ruby on Rails for the admin backend.

I used 2 types of controllers: API and Base.
I used Rails API to generate the backend and created 2 models: Messages and Responses with responses belonging to messages. Each response has a field `next_message` pointing to the next message to be shown if that particular message is picked.
Message has a field `first_asked` which takes `true` or `false` values. This is the first shown message after you say Hello to the bot and can be used as a starting point for different types of actions, each response can then start a different tree of messages and responses.

I used Rails Base and `scaffold` to generate controllers/ views and tests for the admin part.

The home page is build using JavaScript and jQuery. I used AJAX requests to interact with the API controllers which made possible keeping the entire conversation on one page.
The possible responses are buttons and the user can click on the option they want to choose. I used `setTimeout` function to create the impression the bot is thinking.

Tested using Rspec and Capybara. Tests include: requests tests for API, unit tests for admin and feature tests for front-end.

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


## Installation

Clone this repo and run:  
`bundle install`  
`rake db:create`  
`rake db:migrate`  
To run tests use:  
`rspec`

To run it locally use `rails s` and visit the localhost path mentioned in the startup description. Running the app locally means there are no pre-recorded messages. To add messages and answers click on the Admin button and you'll be re-directed to the admin page.

Or you can visit the live app on [Heroku][1] where there are chat/quizzes examples in the db.  

## Challenges

 - I started by generating an API instead of an app which meant part of the basic Rails middleware was missing. I discovered that you can change `config.api_only` from `true` to `false` which re-activates the missing middleware.  
 - Part of the shortcomings of using an API was that de `link_to Destroy` wasn't working properly and I had to set it as a button.
 - I tested the JavaScript home page using Capybara, PhantomJS and Poltergeist, which was difficult to setup. Also, with this combination I couldn't test `map` or `forEach` functions and in one case I had to use a classic `for` loop.


 ## Next steps

  - Adding the possibility for starting a new discussion in the same session
  - Adding a `loading` element to show the bot is thinking
  - Adding styling elements to admin views
  - Adding a more secure authentication solution (maybe using Devise)






[1]: https://chatty-chatbot.herokuapp.com/
