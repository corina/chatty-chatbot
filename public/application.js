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
  interfaceDOM = new InterfaceDOM();
  apiRequest = new ApiRequest();

  $(document.body).on('click', 'button.hello', function(event){
    event.preventDefault();
    apiRequest.makeRequest('?first_asked=true');
  });

  $(document.body).on('click', 'button.response', function(event){
    document.getElementById(event.target.id).style.background="#76D169";
    event.preventDefault();
    next_question = $(this).attr("data-next-question");
    interfaceDOM.deactivateButtons('button.response');
    apiRequest.makeRequest(next_question);
  });
});
