class MessagesController < ApiController
  before_action :set_message

  def index
    json_response(@message)
  end

  def show
    json_response(@message)
  end

  private

  def message_params
    params.permit(:content, :first_asked)
  end

  def set_message
    if params[:first_asked] == true.to_s
      @message = Message.where("first_asked = ?", true)[0]
    else
      @message = Message.find(params[:id])
    end
  end
end
