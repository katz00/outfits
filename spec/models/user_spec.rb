require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  context "バリデーション" do
    it "名前、メールアドレスがあれば有効であること" do
      expect(user).to be_valid
    end

    
  end
end
