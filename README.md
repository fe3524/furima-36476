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
| category    | integer    | null: false                   |
| state_id    | integer    | null: false                   |
| fee_id      | integer    | null: false                   |
| area_id     | integer    | null: false                   |
| day_id      | integer    | null: false                   |
| price       | integer    | null: false                   |
| user_id     | references | null: false foreign_key :user |

### Association

 - belongs_to :user
 - belongs_to :history

## tradings

| Column       | Type       | Options                          |
| ------------ | ---------- | -------------------------------- |
| item         | references | null: false foreign_key :item_id |
| zipcode      | string     | null: false                      |
| state        | string     | null: false                      |
| city         | string     | null: false                      |
| address      | string     | null: false                      |
| building     | string     |                                  |
| phone_number | string     | null: false                      |

### Association

 - has_many :histories

 ## histories

| Column  | Type       | Options                        |
| ------- | ---------- | -----------------------------  |
| user_id | references | null: false foreign_key :user  |
| item_id | references | null: false foreign_key :title |

### Association

- belongs_to :tradings