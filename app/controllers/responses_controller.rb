class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]
  before_action :set_message

  # GET /responses
  def index
    @responses = @message.responses
  end

  # GET /responses/1
  def show
  end

  # GET /responses/new
  def new
    @response = @message.responses.build
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  def create
    @response = @message.responses.build(response_params)

    if @response.save
      redirect_to @message, notice: 'Response was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /responses/1
  def update
    if @response.update(response_params)
      redirect_to @message, notice: 'Response was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /responses/1
  def destroy
    @response.destroy
    redirect_to responses_url, notice: 'Response was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    def set_message
      @message = Message.find(params[:message_id])
    end

    # Only allow a trusted parameter "white list" through.
    def response_params
      params.require(:response).permit(:content, :next_message, :end_game, :message_id)
    end
end
