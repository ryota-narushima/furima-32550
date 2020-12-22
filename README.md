# テーブ設計

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name_j        | string | null: false               |
| first_name_j       | string | null: false               |
| last_name_k        | string | null: false               |
| first_name_k       | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_histories


## itemsテーブル

| Column                  | Type       | Options                        |
|-------------------------|------------|--------------------------------|
| user                    | references | null: false, foreign_key: true |
| name                    | string     | null: false                    |
| description             | text       | null: false                    |
| category_id             | integer    | null: false                    |
| condition_id            | integer    | null: false                    |
| delivery_charge_id      | integer    | null: false                    |
| delivery_source_area_id | integer    | null: false                    |
| days_to_delivery_id     | integer    | null: false                    |
| price                   | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase_history


## purchase_historiesテーブル

| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchaser_address


## purchaser_addressesテーブル

| Column                  | Type       | Options                        |
|-------------------------|------------|--------------------------------|
| purchase_history        | references | null: false, foreign_key: true |
| postal_code             | string     | null: false                    |
| delivery_source_area_id | integer    | null: false                    |
| city                    | string     | null: false                    |
| address                 | string     | null: false                    |
| building                | string     |                                |
| phone_num               | string     | null: false                    |

### Association

- belongs_to :purchase_history





