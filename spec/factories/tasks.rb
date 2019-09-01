FactoryBot.define do
  factory :task do
    name { 'テスト' }
    menu { 'テスト' }
    time { 10 }
    rep { 10 }
    set { 10 }
    comment { 'test' }
    user
  end
end
