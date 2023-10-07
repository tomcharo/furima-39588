# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| nickname            | string  | null: false               |
| birth_date          | date    | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_kana      | string  | null: false               |
| first_name_kana     | string  | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                  | Type        | Options                         |
| ----------------------- | ----------- | ------------------------------- |
| name                    | string      | null: false                     |
| info                    | text        | null: false                     |
| price                   | integer     | null: false                     |
| category_id             | integer     | null: false                     |
| condition_id            | integer     | null: false                     |
| shipping_fee_status_id  | integer     | null: false                     |
| prefecture_id           | integer     | null: false                     |
| delivery_schedule_id    | integer     | null: false                     |
| user                    | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type        | Options                         |
| ------- | ----------- | ------------------------------- |
| user    | references  | null: false, foreign_key: true  |
| item    | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address

## delivery_addresses テーブル

| Column        | Type        | Options                         |
| ------------- | ----------- | ------------------------------- |
| postal_code   | integer     | null: false                     |
| city          | string      | null: false                     |
| address       | string      | null: false                     |
| building      | string      |                                 |
| phone_number  | integer     | null: false                     |
| prefecture_id | integer     | null: false                     |
| order         | references  | null: false, foreign_key: true  |

### Association

- belongs_to :order
