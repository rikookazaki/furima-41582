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


# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

- has_many :items
- has_many :orders



## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| explanation        | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| postage_id         | integer    | null: false |
| prefecture_id      | integer    | null: false |
| how_long_id        | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true|

- belongs_to :user
- has_one :order



## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| post_cord          | string     | null: false |
| prefecture_id      | integer    | null: false |
| city               | string     | null: false |
| address_num        | string     | null: false |
| building           | string     |             |
| phone_num          | integer    | null: false |
| order              | references | null: false, foreign_key: true |

- belongs_to :order