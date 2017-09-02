require 'rails_helper'

RSpec.describe 'Response', type: :request do
  fixtures :messages
  fixtures :responses

  describe 'GET messages/:message_id/responses' do
    context 'valid message id' do
      it 'returns corresponding responses' do
        get '/messages/2/responses'
        json = JSON.parse(response.body)
        expect(response).to be_success
        expect([json[0]['id'], json[1]['id'], json[2]['id']]).to eq [3, 4, 5]
      end
    end

    context 'invalid message id' do
      it 'returns an error' do
        get '/messages/3/responses'
        expect(response).to have_http_status(404)
      end
    end
  end
end
