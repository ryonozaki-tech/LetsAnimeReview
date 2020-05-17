require 'rails_helper'

describe PostsController do
  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@postに正しい値が入っていること" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it "edit.html.hamlに遷移すること" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "@postsに正しい値が入っていること" do
      posts = create_list(:post, 3)
      get :index
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at })
    end

    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #star_ranking' do
    it "@postsに正しい値が入っていること" do
      posts = create_list(:post, 3)
      get :star_ranking
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.rate <=> a.rate })
    end

    it "star_ranking.html.hamlに遷移すること" do
      get :star_ranking
      expect(response).to render_template :star_ranking
    end
  end

  describe 'GET #like_ranking' do
    it "@postに正しい値が入っていること" do
      posts = create_list(:post, 3)
      get :like_ranking
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.likes_count <=> a.likes_count })
    end

    it "like_ranking.html.hamlに遷移すること" do
      get :like_ranking
      expect(response).to render_template :like_ranking
    end
  end

  describe 'GET #show' do
    it "@postに正しい値が入っていること" do
      post = create(:post)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it "show.html.hamlに遷移すること" do
      post = create(:post)
      get :show, params: { id: post }
      expect(response).to render_template :show
    end
  end

#   describe 'POST #create' do
#     it "@postに正しい値が入っていること" do
#       post = create(:post)
#       # post :create
#       expect(assigns(:post)).to eq post
#     end
#     it "index.html.hamlに遷移すること" do
#       post = create(:post)
#       # post :create
#       expect(response).to render_template :index
#     end
#   end

#   # describe 'PATCH #update' do
#   #   it "@postに正しい値が入っていること" do
#   #     post = create(:post)
#   #     post = update(:post, nickname: "saki")
#   #     patch :update, params: { id: post }
#   #     expect(assigns(:post)).to eq post
#   #   end
#   # end

#   describe 'DELETE #destroy' do
#     it "postに値が入っていないこと" do
#       post = create(:post)
#       delete :destroy, params: { id: post }
#       expect(assigns(:post)).to eq nil
#     end
#     it "削除し終えたらその前のビューに遷移すること" do
#       delete :destroy
#       expect(response).to render_template :back
#     end
#   end
end