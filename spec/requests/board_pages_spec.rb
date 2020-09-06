require 'rails_helper'

RSpec.describe 'Access to boards_pages', type: :request do
    context 'GET #index' do
      before { get board_path }
      it 'responds successfully' do
        expect(response).to have_http_status 200
      end
      it "has title 'Music App'" do
        expect(response.body).to include 'Home | Music App'
      end
    end
end