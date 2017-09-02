(function (exports) {

  function InterfaceDOM () {

  }

  InterfaceDOM.prototype.addElementToConversation = function (text, id, elementType) {
    var node = document.createElement(elementType);
    node.id = id;
    var textnode = document.createTextNode(text);
    node.appendChild(textnode);
    document.getElementById("conversation").appendChild(node);
  }

  InterfaceDOM.prototype.addNextMessage = function (id, next_question) {
    element = document.getElementById(id);
    element.setAttribute("data-next-question", next_question);
  }

  InterfaceDOM.prototype.deactivateButtons = function (next_question) {
    var buttons = document.querySelectorAll("button[data-next-question='" + next_question + "']")
    buttons.forEach(function(button) {
      button.disabled = true;
    });
  }

  InterfaceDOM.prototype.addMessage = function (message) {
    this.addElementToConversation(message.content, "message" + message.id, "LI");
  };

  InterfaceDOM.prototype.addEachResponse = function(data) {
    _this = this;
    data.forEach(function(element){
      _this.addElementToConversation(element.content, "response" + element.id, "BUTTON");
      _this.addNextMessage("response" + element.id, element.next_message);
    })
  }

  exports.InterfaceDOM = InterfaceDOM;

})(this);
