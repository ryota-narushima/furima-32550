# テーブ設計

## usersテーブル

| Column       | Type   | Options     |
|--------------|--------|-------------|
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| last_name_j  | string | null: false |
| first_name_j | string | null: false |
| last_name_k  | string | null: false |
| first_name_k | string | null: false |
| birth_day    | date   | null: false |

### Association

- has_many :items
- has_many :purchase_histories


## itemsテーブル

| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| user_id              | references | null: false, foreign_key: true |
| image                |            |                                |
| item_name            | string     | null: false                    |
| item_description     | text       | null: false                    |
| item_category        | string     | null: false                    |
| item_condition       | string     | null: false                    |
| delivery_charge      | string     | null: false                    |
| delivery_source_area | string     | null: false                    |
| days_to_delivery     | string     | null: false                    |

### Association

- belongs_to :user
- has_one :purchase_history


## purchase_historiesテーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchaser's_address


## purchaser's_addressテーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| purchase_id | references | null: false, foreign_key: true |
| postal_code | string     | null: false                    |
| state       | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| phone_num   | string     | null: false                    |

### Association

- belongs_to :purchase_history





