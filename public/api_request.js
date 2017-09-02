(function(exports) {

  function ApiRequest () {

  };

  function responseRequest(message_id, callback) {
    $.get("http://localhost:3000/messages/" + message_id + "/responses", callback);
  }

  function messageRequest(message_id, callback) {
    $.get("http://localhost:3000/messages/" + message_id, callback);
  }

  function insertElements(message, responses) {
    interfaceDOM.addMessage(message);
    interfaceDOM.addEachResponse(responses);
  };

  ApiRequest.prototype.makeRequest = function (message_id) {
    messageRequest(message_id, function(message) {
      responseRequest(message_id, function(responses) {
        insertElements(message, responses);
      });
    })
  }

  exports.ApiRequest = ApiRequest;

})(this);
