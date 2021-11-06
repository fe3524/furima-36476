# README

## users

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false              |
| email               | string | null: false unique :true |
| encrypted_password  | string | null: false              |
| last_name           | string | null: false              |
| first_name          | string | null: false              |
| last_name_kana      | string | null: false              |
| first_name_kana     | string | null: false              |
| birthday            | date   | null: false              |

### Association

 - has_many :items
 - has_many :histories

## items

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| title       | string     | null: false                   |
| description | text       | null: false                   |
| category_id | integer    | null: false                   |
| state_id    | integer    | null: false                   |
| fee_id      | integer    | null: false                   |
| status_id   | integer    | null: false                   |
| day_id      | integer    | null: false                   |
| price       | integer    | null: false                   |
| user        | references | null: false foreign_key :true |

### Association

 - belongs_to :user
 - has_one :history

## tradings

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| history      | references | null: false foreign_key :true |
| zipcode      | string     | null: false                   |
| state_id     | integer    | null: false                   |
| city         | string     | null: false                   |
| address      | string     | null: false                   |
| building     | string     |                               |
| phone_number | string     | null: false                   |

### Association

 - belongs_to :history

 ## histories

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false foreign_key :true |
| item   | references | null: false foreign_key :true |

### Association

- has_one :trading
- belongs_to: user
- belongs_to: item
