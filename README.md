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

<<<<<<< HEAD
=======

#2022/6/17　修正
>>>>>>> d6b926cb205e07bc0ba22fc25c94e2456be6351a
## users テーブル

| Column               | Type        | Options     |
| -------------------- | ----------- | ----------- |
| email                | string      | null: false |
| encrypted_password   | string      | null: false |
| nickname             | string      | null: false |
| last_name            | string      | null: false |
| first_name           | string      | null: false |
| last_name_kana       | string      | null: false |
| first_name_kana      | string      | null: false |
| first_name_kana      | string      | null: false |
| birth_date           | date        | null: false |

### Association

- has_manny :items
- has_many :orders

## items テーブル

| Column                     | Type      | Options                        |
| -------------------------- | ----------| ------------------------------ |
| item_name                  | string    | null: false                    |
| item_info                  | text      | null: false                    |
| item_category              | string    | null: false                    |
| item_sales_status          | text      | null: false                    |
| item_shipping_fee_status   | string    | null: false                    |
| item_prefecture            | string    | null: false                    |
| item_scheduled_delivery    | string    | null: false                    |
| item_price                 | integer   | null: false                    |
| user                       | reference | null: false, foreign_key: true |

### Association

- belongs_to :user

## orders テーブル

| Column          | Type            | Options                        |
| --------------- | ----------------| -----------------------------  |
<<<<<<< HEAD
| item            | references      | null: false, foreign_key: true |
| user            | references      | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## addresses テーブル
| Column          | Type            | Options                        |
| --------------- | ----------------| -----------------------------  |
=======
| card_number     | string          | null: false                    |
| card_exp_month  | string          | null: false                    |
| card_exp_year   | string          | null: false                    |
| card_cvc        | string          | null: false                    |
>>>>>>> d6b926cb205e07bc0ba22fc25c94e2456be6351a
| postal_code     | string          | null: false                    |
| prefecture      | string          | null: false                    |
| city            | string          | null: false                    |
| addresses       | string          | null: false                    |
<<<<<<< HEAD
| building        | string          |                                |
| order           | references      | null: false, foreign_key: true |

### Association
- belongs_to :order
=======
| building        | string          | null: false                    |
| phone_number    | string          | null: false                    |
| user            | references      | null: false, foreign_key: true |

### Association

- belongs_to :user
>>>>>>> d6b926cb205e07bc0ba22fc25c94e2456be6351a
