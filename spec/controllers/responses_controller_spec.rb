require 'rails_helper'

RSpec.describe ResponsesController, type: :controller do

  let(:valid_attributes) {{
    content: 'Yes',
    next_message: 2,
    end_game: false,
    message_id: 1
  }}

  let(:invalid_attributes) {{
    next_message: 2,
    end_game: false,
    message_id: 1
  }}

  let(:message) {{
    id: 1,
    content: "Do you want to play a game?",
    first_asked: true
    }}


  describe "GET #index" do
    it "returns a success response" do
      r = Response.create! valid_attributes
      get :index, params: {message_id: 1}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      r = Response.create! valid_attributes
      get :show, params: {message_id: 1, id: r.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {message_id: 1}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      r = Response.create! valid_attributes
      get :edit, params: {message_id: 1, id: r.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Response" do
        expect {
          post :create, params: {message_id: 1, response: valid_attributes}
        }.to change(Response, :count).by(1)
      end

      it "redirects to the created response" do
        post :create, params: {message_id: 1, response: valid_attributes}
        expect(response).to redirect_to(message_response_path(1, Response.last))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {message_id: 1, response: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      it "redirects to the response" do
        r = Response.create! valid_attributes
        put :update, params: {message_id: 1, id: r.to_param, response: valid_attributes}
        expect(response).to redirect_to(message_response_path(1, r))
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested response" do
      r = Response.create! valid_attributes
      expect {
        delete :destroy, params: {message_id: 1, id: r.to_param}
      }.to change(Response, :count).by(-1)
    end

    it "redirects to the responses list" do
      r = Response.create! valid_attributes
      delete :destroy, params: {message_id: 1, id: r.to_param}
      expect(response).to redirect_to(message_responses_path(1))
    end
  end

end
