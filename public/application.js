// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .



$(document).ready(function () {

  function addNextQuestion(next_question) {

  }

  function addElementToConversation(text, id, elementType) {
    var node = document.createElement(elementType);
    node.id = id;
    var textnode = document.createTextNode(text);
    node.appendChild(textnode);
    document.getElementById("conversation").appendChild(node);
  }

  function addNextMessage(id, next_question) {
    element = document.getElementById(id);
    element.setAttribute("data-next-question", next_question);
  }

  function requestApi(message_id) {
    $.get("http://localhost:3000/messages/" + message_id, function(data, status){
      addElementToConversation(data.content, "message" + data.id, "LI");
    });

    $.get("http://localhost:3000/messages/" + message_id + "/responses", function(data, status){
      console.log(data);
      data.forEach(function(element){
        addElementToConversation(element.content, "response" + element.id, "BUTTON");
        addNextMessage("response" + element.id, element.next_message);
      })
    });
  };

  requestApi(1);

  $(document.body).on('click', 'button', function(event){
    event.preventDefault();
    next_question = $(this).attr("data-next-question")
    console.log(next_question);
    requestApi(next_question)
  });
});
