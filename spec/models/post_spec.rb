require 'rails_helper'

describe Post do
  describe '#create' do
    let(:user) {create(:user)}
    let(:post) {build(:post, user_id: user.id)}
    # 1
    it "title, review, rate, が存在すれば登録できること" do
      post = build(:post)
      expect(post).to be_valid
    end
    # 2
    it 'titleがない場合は登録できないこと' do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("can't be blank")
    end
    # 3
    it 'reviewがない場合は登録できないこと' do
      post = build(:post, review: nil)
      post.valid?
      expect(post.errors[:review]).to include("can't be blank")
    end
    # 4
    it 'rateがない場合は登録できないこと' do
      post = build(:post, rate: nil)
      post.valid?
      expect(post.errors[:rate]).to include("can't be blank")
    end
    
  end
end
