require 'rails_helper'

describe 'タスク管理機能', type:  :system do

    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
    let!(:task_a) { FactoryBot.create(:task, menu: '最初のメニュー', user: user_a) }

    before do
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

  describe '一覧表示機能'  do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it 'ユーザーAが作成したメニューが表示される' do
        expect(page).to have_content '最初のメニュー'
      end
    end


    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

        it 'ユーザーAが作成したメニューが表示されない' do
          expect(page).to have_no_content '最初のメニュー'
        end
    end
  end
    describe '詳細表示機能' do
      context 'ユーザーAがログインしているとき' do
        let(:login_user) { user_a }

        before do
          visit tasks_path(task_a)
        end

        it 'ユーザーAが作成したメニューが表示される' do
          expect(page).to have_content '最初のメニュー'
        end
      end
    end

end


