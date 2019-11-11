require 'rails_helper'

RSpec.describe "Sign in", type: :system do
  let(:user) { FactoryBot.create(:user, name: 'user_a', email: 'user_a@example.com') }

  before do
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    fill_in 'パスワード（確認）', with: login_user.password
    click_button 'ログイン'
  end

  context '有効な情報が送信されたとき' do
    let(:login_user) { user }
    it 'homeページが表示される' do
      expect(page).to have_content 'ログインしました。'
    end
  end
end