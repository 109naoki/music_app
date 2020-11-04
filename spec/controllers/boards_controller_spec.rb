require 'rails_helper'

 RSpec.describe BoardsController, type: :controller do

    describe "#index" do
        # 認証済みのユーザとして
        context "as an authenticated user" do
           before do
           @user = FactoryBot.create(:user)
        end

        #正常にレスポンスを返すこと
        it "responds successfully" do
            sign_in @user
            get :index
            expect(response).to be_successful
        end

        # 200レスポンスを返すこと
        it "returns a 200 response" do
            sign_in @user
            get :index
            expect(response).to have_http_status "200"
        end
    end
         # ゲストとして
    context "as a guest" do
        # 302レスポンスを返すこと
        it "returns a 302 response" do
            get :index
            expect(response).to have_http_status "302"
        end
        # サイン画面にリダイレクトすること
        it "redirects to the sign-in page"do
            get :index
            expect(response).to redirect_to "/users/sign_in"
        end
    end
end


    #    boards_new
        describe "#new" do
        # 認証済みのユーザとして
        context "as an authenticated user" do
           before do
           @user = FactoryBot.create(:user)
        end

        #正常にレスポンスを返すこと
        it "responds new successfully" do
            sign_in @user
            get :new
            expect(response).to be_successful
        end

        # 200レスポンスを返すこと
        it "new returns a 200 response" do
            sign_in @user
            get :new
            expect(response).to have_http_status "200"
        end
     end

         # ゲストとして
    context "as a guest" do
        # 302レスポンスを返すこと
        it "returns a 302 response" do
            get :new
            expect(response).to have_http_status "302"
        end
        # サイン画面にリダイレクトすること
        it "redirects to the sign-in page"do
            get :new
            expect(response).to redirect_to "/users/sign_in"
        end
    end
 end


    #    boards_create
        describe "#create" do
        # 認証済みのユーザとして
        context "as an authenticated user" do
           before do
           @user = FactoryBot.create(:user)
        end
    end
         # ゲストとして
    context "as a guest" do
        # 302レスポンスを返すこと
        it "returns a 302 response" do
            get :create
            expect(response).to have_http_status "302"
        end
        # サイン画面にリダイレクトすること
        it "redirects to the sign-in page"do
            get :create
            expect(response).to redirect_to "/users/sign_in"
        end
    end
 end
end
