# レジュメ 

### 筋トレ好きのための筋トレタスク管理アプリ

#### Heroku： https://muscle-task.herokuapp.com/login

#### ログイン

ログイン画面に行くとテストログインが可能です

pcスペック
* MacBook Air (13-inch, Early 2015)

* Mac OS Mojave

* ruby 2.6.3

* rails 5.2.3

* DB:Mysql

* テンプレートエンジン:Slim 

機能
* タスクCRUD機能
* ログイン機能
* バリデーション機能
* Rspecを用いたテスト機能
* テストユーザーログイン


model

Task  
* name:string
* menu:string 
* time:integer
* rep:integer
* set:integer
* comment:text

User
* name:string
* email:string
* password:password_digest
* admin:boolean
