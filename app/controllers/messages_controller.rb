class MessagesController < ApiController
  before_action :set_message

  def show
    json_response(@message)
  end

  private

  def message_params
    params.permit(:content, :first_asked)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
