require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  let(:valid_attributes) {{
    content: "Do you want to play a game?",
    first_asked: true
    }}

  let(:invalid_attributes) {{
    first_asked: true
    }}

  describe "GET #index" do
    it "returns a success response" do
      message = Message.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      message = Message.create! valid_attributes
      get :show, params: {id: message.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      message = Message.create! valid_attributes
      get :edit, params: {id: message.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, params: {message: valid_attributes}
        }.to change(Message, :count).by(1)
      end

      it "redirects to the created message" do
        post :create, params: {message: valid_attributes}
        expect(response).to redirect_to(Message.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {message: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{
        content: "Do you want to have a chat?",
        first_asked: true
        }}

      it "redirects to the message" do
        message = Message.create! valid_attributes
        put :update, params: {id: message.to_param, message: valid_attributes}
        expect(response).to redirect_to(message)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested message" do
      message = Message.create! valid_attributes
      expect {
        delete :destroy, params: {id: message.to_param}
      }.to change(Message, :count).by(-1)
    end

    it "redirects to the messages list" do
      message = Message.create! valid_attributes
      delete :destroy, params: {id: message.to_param}
      expect(response).to redirect_to(messages_url)
    end
  end

end
