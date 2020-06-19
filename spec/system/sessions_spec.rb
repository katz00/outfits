require 'rails_helper'

RSpec.describe "ログイン", type: :system do
  let!(:user){ create(:user) }

  before do
    visit login_path
  end

  describe "ログインページ" do
    context "ページレイアウト" do
      it "「ログイン」の文字列が存在すること" do
        expect(page).to have_content "ログイン"
      end

      it "正しいタイトルが表示されていること" do
        expect(page).to have_title full_title("ログイン")
      end

      it "ヘッダーにログインページへのリンクがあること" do
        expect(page).to have_link 'ログイン', href: login_path
      end

      it "ログインフォームのラベルが正しく表示されていること" do
        expect(page).to have_content 'メールアドレス'
        expect(page).to have_content 'パスワード'
      end

      it "ログインフォームの入力欄が正しく表示されていること" do
        expect(page).to have_css 'input#user_email'
        expect(page).to have_css 'input#user_password'
      end

      it "ログインボタンが表示されていること" do
        expect(page).to have_button 'ログイン'
      end


    end
  end
end