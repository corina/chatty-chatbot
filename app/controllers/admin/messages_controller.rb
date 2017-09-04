class Admin::MessagesController < Admin::ApplicationController

  def index
    Message.all
  end

  def show
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
