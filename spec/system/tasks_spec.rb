require 'rails_helper'

describe 'タスク管理機能', type:  :system do

    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
    let!(:task_a) { FactoryBot.create(:task, menu: '最初のメニュー', user: user_a) }

    before do
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      fill_in 'パスワード（確認）', with: login_user.password
      click_button 'ログイン'
      visit tasks_path
    end

    shared_examples_for 'ユーザーAが作成したメニューが表示される' do
      it { expect(page).to have_content 'タスク一覧' }
    end

  describe '一覧表示機能'  do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成したメニューが表示される'
    end
  end
    describe '詳細表示機能' do
      context 'ユーザーAがログインしているとき' do
        let(:login_user) { user_a }

        before do
          visit tasks_path(task_a)
        end

       it_behaves_like 'ユーザーAが作成したメニューが表示される'
      end
    end

    describe '新規作成機能' do
      let(:login_user) { user_a }

      before do
        visit new_task_path
        fill_in 'トレーニングメニュー', with: task_menu
        click_button '登録する'
      end



      context '新規作成画面で名前を入力しなかったとき' do
        let(:task_menu) { '' }

        it 'エラー発生' do

          within '#error_explanation' do
            expect(page).to have_content 'トレーニングメニューを入力してください'
          end
        end
      end
    end

end


