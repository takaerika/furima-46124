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
| birth_date         | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options     |
| --------------- | -----------| ----------- |
| name            | string     | null: false, limit:40 |
| description     | text       | null: false, limit: 1000 |
| category_id     | integer    | null: false |
| condition_id    | integer    | null: false |
| shipping_fee_id | integer    | null: false |
| prefecture_id   | integer    | null: false |
| shipping_day_id | integer    | null: false |
| price           | integer    | null: false |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column | Type         | Options                         |
| ------ | ------------ | ------------------------------- |
| user   | t.references | null: false, foreign_key: true  |
| item   | t.references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |
| order         | references | null: false, foreign_key: true  |

### Association

-  belongs_to :order

