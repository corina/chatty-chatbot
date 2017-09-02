(function(exports) {

  function ApiRequest () {

  };

  ApiRequest.prototype.responseRequest = function (message_id, callback) {
    $.get("http://localhost:3000/messages/" + message_id + "/responses", callback);
  }

  ApiRequest.prototype.messageRequest = function (message_id, callback) {
    $.get("http://localhost:3000/messages/" + message_id, callback);
  }

  ApiRequest.prototype.insertElements = function (message, responses) {
    interfaceDOM.addMessage(message);
    interfaceDOM.addEachResponse(responses);
  };

  ApiRequest.prototype.makeRequest = function (message_id) {
    _this = this;
    this.messageRequest(message_id, function(message) {
      _this.responseRequest(message_id, function(responses) {
        _this.insertElements(message, responses);
      });
    })
  }

  exports.ApiRequest = ApiRequest;

})(this);
