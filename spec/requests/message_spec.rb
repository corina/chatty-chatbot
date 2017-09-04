require 'rails_helper'

RSpec.describe 'Message', type: :request do
  fixtures :messages
  fixtures :responses

  describe 'GET messages/:message_id' do
    context 'valid message_id' do
      it 'returns the message' do
        get '/messages/2'
        json = JSON.parse(response.body)
        expect(response).to be_success
        expect(json['content']).to eq "You've chosen trivia. What are penguins famous for?"
      end
    end

    context 'invalid message id' do
      it 'returns an error' do
        get '/messages/3'
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'GET messages/' do
    context 'query params first_asked=true' do
      it 'returns the message with first_asked property true' do
        get '/messages?first_asked=true'
        json = JSON.parse(response.body)
        expect(response).to be_success
        expect(json['content']).to eq "Do you want to play a game?"
      end
    end
  end
end
