(function (exports) {

  function InterfaceDOM () {

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

  function addResponseClass(id) {
    element = document.getElementById(id);
    $(element).addClass("response");
  }

  InterfaceDOM.prototype.deactivateButtons = function (property) {
    var buttons = document.querySelectorAll(property)
    buttons.forEach(function(button) {
      button.disabled = true;
    });
  }

  InterfaceDOM.prototype.addMessage = function (message) {
    addElementToConversation(message.content, "message" + message.id, "LI");
  };

  InterfaceDOM.prototype.addEachResponse = function(data) {
    data.forEach(function(element){
      addElementToConversation(element.content, "response" + element.id, "BUTTON");
      addNextMessage("response" + element.id, element.next_message);
      addResponseClass("response" + element.id);
    })
  }

  exports.InterfaceDOM = InterfaceDOM;

})(this);
