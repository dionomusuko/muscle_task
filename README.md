# Muscle_task

### 筋トレ好きのためのアプリ
* 筋トレの記録ができる！
* 筋トレした内容の共有ができる！
* おすすめの筋トレについてSNSで話せる！

### Heroku： https://muscle-task.herokuapp.com

### ログイン

ログイン画面に行くとテストログインが可能です

# 使用技術

* ruby 2.6.3
* rails 5.2.3
* DB:Mysql
* テンプレートエンジン:Slim 
* scss
* bootstrap
* s3

# 機能・Gem

* 記事投稿(Muscle_SNS)
    * CRUD機能
    * kaminariを用いたページネーション機能
* ユーザー機能
    * ユーザー登録・ログイン機能
    * 一覧表示機能(admin userのみ)
* 筋トレタスク機能
    * CRUD機能
* 環境変数(dotenv)
* Rspec
* s3による画像管理(productionのみ)
 



