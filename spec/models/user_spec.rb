require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context "バリデーション" do
    it "名前、メールアドレスがあれば有効であること" do
      expect(user).to be_valid
    end

    it "名前がなければ無効であること" do
      user = build(:user, name: nil )
      user.valid?
      expect(user.errors[:name]).to include "を入力してください"
    end

    it "名前が50文字以上なら無効であること" do
      user = build(:user, name: " a * 51 " )
      user.valid?
      expect(user.errors[:name]).to include "は50文字以内で入力してください"
    end

    it "メールアドレスがなければ無効であること"do
      user = build(:user, email: nil )
      user.valid?
      expect(user.errors[:email]).to include "を入力してください"
    end

    it "メールアドレスが255文字以上なら無効であること" do
      user = build(:user, email: " #{ "a" * 244 }@example.com" )
      user.valid?
      expect(user.errors[:email]).to include "は255文字以内で入力してください"
    end

    it "重複したメールアドレスは無効であること" do
      other_user = build(:user, email: user.email )
      other_user.valid?
      expect(other_user.errors[:email]).to include "はすでに存在しています"
    end

    it "メールアドレスは小文字で保存されること" do
      emial = "ExamPle@sample.com"
      user = create(:user, email: email)
      expect(user.email).to eq email.downcase
    end

    it "パスワードが無ければ無効な状態であること" do
      user = build(:user, password: nil, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password]).to include "を入力してください"
    end

    it "パスワードは6文字以上であること" do
      user = build(:user, password: "a" * 5 , password_confirmation: "a" * 5 )
      user.valid?
      expect(user.errors[:password]).to include "は6文字以上で入力してください"
    end
  end
end
