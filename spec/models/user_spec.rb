require 'rails_helper'

describe User do
  describe '#create' do

    # 1
    it "nickname、email、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    # 2
    it 'nicknameがない場合は登録できないこと' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    # 3
    it 'emailがない場合は登録できないこと' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    # 4
    it 'passwordがない場合は登録できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    # 5
    it 'passwordが存在してもpassword_confirmationがない場合は登録できないこと' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    # 6
    it 'nicknameが7文字以上であれば登録できないこと' do
      user = build(:user, nickname: "akoakoa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end
    # 7
    it 'nicknameが6文字以下であれば登録できること' do
      user = build(:user, nickname: "akoako")
      user.valid?
      expect(user).to be_valid
    end
    # 8
    it '重複したemailが存在する場合は登録できないこと' do
      user = create(:user)
      another_user = build(:user, nickname: "saki", email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    # 9
    it 'passwordが6文字以上であれば登録できること' do
      user = build(:user, password: "abcdef", password_confirmation: "abcdef")
      user.valid?
      expect(user).to be_valid
    end
    # 10
    it 'passwordが5文字以下であれば登録できないこと' do
      user = build(:user, password: "abcde", password_confirmation: "abcde")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

  end
end
