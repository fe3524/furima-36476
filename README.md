# README

## users

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| birthday            | string | null: false |

### Association

 - has_many :items
 - has_many :tradings

## items

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| title          | string     | null: false                   |
| description    | text       | null: false                   |
| category       | string     | null: false                   |
| shipping_state | string     | null: false                   |
| shipping_fee   | string     | null: false                   |
| shipping_area  | string     | null: false                   |
| shipping_days  | string     | null: false                   |
| price          | integer    | null: false                   |
| user           | references | null: false foreign_key :user |

### Association

 - belongs_to :user
 - belongs_to :trading

## trading

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| trading_item      | references | null: false foreign_key :item |
| seller            | references | null: false foreign_key :user |
| buyer             | references | null: false foreign_key :user |
| zipcode           | string     | null: false                   |
| state             | string     | null: false                   |
| city              | string     | null: false                   |
| address           | string     | null: false                   |
| building          | string     |                               |
| phone_number      | string     | null: false                   |

### Association

 - belongs_to :user
 - has_one :items