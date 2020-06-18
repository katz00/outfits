require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "トップページ" do
    context "ページ全体" do
      before do
        visit root_path
      end

      it "outfitsの文字列が存在することを確認" do
        expect(page).to have_content 'outfits'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title
      end
    end
  end

  describe "aboutページ" do
    before do
      visit about_path
    end

    it "outfitsとは？の文字列が存在すること" do
      expect(page).to have_content "outfitsとは？"
    end

    it "正しいタイトルが表示されていること" do
      expect(page).to have_title full_title
    end
  end
end
