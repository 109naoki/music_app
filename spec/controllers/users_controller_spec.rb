require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#edit" do
    context "ログインしているユーザとして" do
    let(:user){FactoryBot.create(:user)}
    it "正常にレスポンスを返すこと" do
      sign_in user
      get :edit_user_registration
      expect(response).to be_successful
    end
  end
end
end
