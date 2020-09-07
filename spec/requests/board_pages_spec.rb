require 'rails_helper'

RSpec.describe 'Access to boards_pages', type: :request do

# homeページに行きhttpレスポンスが200で返されtitleにHome | Music Appが含まれること
context 'GET #home' do
  before { get root_path } 
  it 'responds successfully' do
    expect(response).to have_http_status 200
  end
  it "has title 'Home Music App'" do
    expect(response.body).to include 'Home | Music App'
  end
end

  # indexページに行きhttpレスポンスが200で返されtitleにBoards | Music Appが含まれること
    context 'GET #index' do
      before { get boards_path }
      it 'responds successfully' do
        expect(response).to have_http_status 200
      end
      it "has title 'Boards App'" do
        expect(response.body).to include 'Boards | Music App'
      end
    end
  end