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

#2022/7/5　修正

## users テーブル

| Column               | Type        | Options                       |
| -------------------- | ----------- | ----------------------------- |
| email                | string      | null: false, unique: true     |
| encrypted_password   | string      | null: false                   |
| nickname             | string      | null: false                   |
| last_name            | string      | null: false                   |
| first_name           | string      | null: false                   |
| last_name_kana       | string      | null: false                   |
| first_name_kana      | string      | null: false                   |
| birth_date           | date        | null: false                   |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                        | Type       | Options                        |
| ----------------------------- | ---------  | ------------------------------ |
| item_name                     | string     | null: false                    |
| item_info                     | text       | null: false                    |
| category_id 　　　             | integer    | null: false                    |
| status_id 　　　　　　　        | integer    | null: false                    |
| shipping_id  　　　　　　　　　　| integer    | null: false                    |
| prefecture_id                 | integer    | null: false                    |
| delivery_id                   | integer    | null: false                    |
| item_price                    | integer    | null: false                    |
| user                          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column          | Type            | Options                        |
| --------------- | ----------------| -----------------------------  |
| item            | references      | null: false, foreign_key: true |
| user            | references      | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
| Column              | Type            | Options                        |
| ------------------- | --------------- | -----------------------------  |
| postal_code         | string          | null: false                    |
| prefecture_id 　　　 | integer         | null: false                    |
| city                | string          | null: false                    |
| addresses           | string          | null: false                    |
| building            | string          |                                |
| phone_number        | string          | null: false                    |
| order               | references      | null: false, foreign_key: true |

### Association
- belongs_to :order

