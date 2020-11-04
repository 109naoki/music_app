require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    let(:user){FactoryBot.create(:user)}

    # 正常にレスポンスを返すこと
    it "Returning a response normally" do
      sign_in user
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    # 200レスポンスを返すこと
    it "returns a 200 response" do
      sign_in user
      get :show, params: { id: user.id }
      expect(response).to have_http_status "200"
    end
  end
end
