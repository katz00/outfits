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

    context "ログイン処理" do
      it "無効なユーザーでログインするとログインに失敗することを確認" do
        fill_in "user_email", with: "user@example.com"
        fill_in "user_password", with: "pass"
        click_button 'ログイン'
        expect(page).to have_content "メールアドレスとパスワードの組み合わせが間違っています"
      end

      it "有効なユーザーでログインする前後でヘッダー情報が正しく切り替わることを確認" do
        expect(page).to have_link 'outfitsとは？', href: about_path
        expect(page).to have_link 'ログイン', href: login_path
        expect(page).to have_link  '新規登録(無料)', href: signup_path
        expect(page).not_to have_link 'ログアウト', href: logout_path

        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_button 'ログイン'

        expect(page).to have_link 'outfitsとは？', href: about_path
        expect(page).to have_link 'ログアウト', href: logout_path
        expect(page).to have_link 'プロフィール', href: user_path(user)
        expect(page).not_to have_link 'ログイン', href: login_path
        expect(page).not_to have_link '新規登録(無料)', href: signup_path
      end
    end
  end
end