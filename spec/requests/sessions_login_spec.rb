require 'rails_helper'

RSpec.describe "ログイン", type: :request do
  let!(:user) { create(:user) }
  
  it "正常なレスポンスを返すこと" do
    get login_path
    expect(response).to be_success
    expect(response).to have_http_status "200"
  end

  it "有効なユーザーでログインしてログアウトができること" do
    get login_path
    post login_path, params:{ session:{ email: user.email,
                                          password: user.password } }
    redirect_to user_path(user)
    follow_redirect!
    expect(response).to render_template 'users/show'
    expect(is_logged_in?).to be_truthy
    delete logout_path
    redirect_to login_path
    expect(is_logged_in?).not_to be_truthy
  end

end
