class ResponsesController < ApiController
  before_action :set_message

  def index
    json_response(@message.responses)
  end

  private

  def response_params
    params.permit(:content, :next_message, :end_game)
  end

  def set_message
    @message = Message.find(params[:message_id])
  end
end
