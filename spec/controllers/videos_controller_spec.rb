require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  let(:user) {FactoryBot.create :user}
  before {sign_in user}
  let(:video) {FactoryBot.create :video}
  subject {video}

  let(:video_invalid) do 
    {
      name: "",
      video_url: "",
      user_id: ""
    }
  end

  describe "GET #index" do
    context "as an  authenticated user" do
      it "has 200 status code" do
        get :index
        expect(response.status).to eq(200)
      end
      it "return http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
      it "render index" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe "GET #new" do
    it "assigns a blank video to the view" do
      get :new
      expect(assigns(:video)).to be_a_new(Video)
    end
  end
  describe "POST #create" do
    before {post :create, params: {video: FactoryBot.attributes_for(:video)}}
    context "with valid attributes" do 
      it "create new a video" do
        expect(assigns(:video)).to be_a_new(Video)
      end
    end
    context "with invalid attributes" do
      it "create fail" do
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    it "with valid name" do
      patch :update, params: {id: subject.id, video: {name: "video_yoga"}}
      expect(response).to redirect_to(video_path(subject.id))
    end
  end

  describe "DELETE #destroy" do
    before {delete :destroy, params: {id: subject.id}}
    context "success" do
      it "redirects after destroy" do
        expect(response).to redirect_to videos_path
      end
    end
  end
end
