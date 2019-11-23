
require 'rails_helper'

RSpec.describe "Sign-up", type: :system do
  include ActiveJob::TestHelper

  scenario "ユーザを登録しました" do
    visit '/admin/users/new'

    perform_enqueued_jobs do
      expect {
        fill_in "名前", with: "Test"
        fill_in "メールアドレス", with: "test@example.com"
        fill_in "パスワード", with: "test123"
        fill_in "パスワード（確認）", with: "test123"
        click_button "登録する"
      }.to change(User, :count).by(1)

      expect(page).to \
        have_content "ようこそ！　ユーザー登録しました。"
    end
  end
end