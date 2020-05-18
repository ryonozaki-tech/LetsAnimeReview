# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリ名　Let's Anime Review!!

# 概要(このアプリでできること)
## 未ログイン時
- 他のユーザーの感想の閲覧
- ジャンル別の投稿一覧
- 5段階評価でのランキング閲覧(総合、ジャンル別ページあり)
- いいねの数でのランキング閲覧
- 各ユーザーの投稿一覧ページ閲覧
- 投稿のタイトル検索

## ログイン時
- 自分が見たアニメの感想を投稿
- 投稿主なら編集・削除
- いいね機能で気になる作品をマイページのいいね一覧に保存・削除
- 他のユーザーの投稿にコメントとその削除

# 制作背景(意図)
- 自分がまだ知らないアニメとの出会いを作るため
- 抱いた感想を他のユーザーと共有し、輪を広げるため
- 他のユーザーの感想を見ることで新しい見方や着想を得るため

# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
　⇒できている範囲で貼り付けましょう。
# 実装予定の内容
- APIを用いて作品を選択させ、評価の平均値を算出し、ランキング化
- フォロー機能で、他ユーザーに干渉されない1対1のコミュニケーションの場を設置


# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :posts
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|review|text|null: false|
|image|text||
|user_id|references|null: false, foreign_key: true|
<!-- |genre_id|references|null: false, foreign_key: true| -->
### Association
- belongs_to :user
- has_many :comments
- has_many :genre_posts
- has_many  :genres, through: :genre_posts

## genresテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :genre_posts
- has_many  :posts, through: :genre_posts

## genre_postsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|references|null: false, foreign_key: true|
|genre_id|references|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :genre

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user
