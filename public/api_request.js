(function(exports) {

  function ApiRequest () {

  };

  function responseRequest(message_id, callback) {
    $.get("/messages/" + message_id + "/responses", callback);
  }

  function messageRequest(message_id, callback) {
    $.get("/messages/" + message_id, callback);
  }

  function insertElements(message, responses) {
    interfaceDOM.addMessage(message);
    interfaceDOM.addEachResponse(responses);
  };


  function getMessageId(message_id, message) {
    if (message_id == '?first_asked=true') {
      return message.id
    } else {
      return message_id
    }
  }

  ApiRequest.prototype.makeRequest = function (message_id) {
    messageRequest(message_id, function(message, error) {
      responseRequest(getMessageId(message_id, message), function(responses, error) {
        insertElements(message, responses);
      });
    })
  }

  exports.ApiRequest = ApiRequest;

})(this);
