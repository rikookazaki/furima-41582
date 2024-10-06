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
| password           | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

- has_many :items
- has_many :orders



## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| image              | string  | null: false |
| name               | string  | null: false |
| explanation        | text    | null: false |
| category           | string  | null: false |
| state              | string  | null: false |
| postage            | string  | null: false |
| area               | string  | null: false |
| how_long           | string  | null: false |
| price              | integer | null: false |
| user_id            | integer | null: false |

- belongs_to :user
- has_one :order



## orders テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| card_cord          | integer | null: false |
| card_expiry        | integer | null: false |
| card_cvc           | integer | null: false |
| post_cord          | string  | null: false |
| prefecture         | string  | null: false |
| city               | string  | null: false |
| address_num        | string  | null: false |
| building           | string  |             |
| phone_num          | integer | null: false |
| user_id            | integer | null: false |
| item_id            | integer | null: false |

- belongs_to :user
- belongs_to :item