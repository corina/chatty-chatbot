class ResponsesController < ApplicationController
  before_action :authenticate
  before_action :set_response, only: [:show, :edit, :update, :destroy]
  before_action :set_message

  def index
    @responses = @message.responses
  end

  def show
  end

  def new
    @response = @message.responses.build
  end

  def edit
  end

  def create
    @response = @message.responses.build(response_params)

    if @response.save
      redirect_to message_response_path(@message, @response), notice: 'Response was successfully created.'
    else
      render :new
    end
  end

  def update
    if @response.update(response_params)
      redirect_to message_response_path(@message, @response), notice: 'Response was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @response.destroy
    redirect_to message_responses_path(@message), notice: 'Response was successfully destroyed.'
  end

  private
    def set_response
      @response = Response.find(params[:id])
    end

    def set_message
      @message = Message.find(params[:message_id])
    end

    def response_params
      params.require(:response).permit(:content, :next_message, :end_game, :message_id)
    end
end
