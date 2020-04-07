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

# Lets DB設計
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
|genre_id|references|null: false, foreign_key: true|
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