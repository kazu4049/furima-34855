# README

## users　テーブル

|Column               |Type      |Options                   |
|---------------------|----------|--------------------------|
| name                | string   | null: false              |
| encrypted_password  | string   | null: false              |
| email               | string   | null: false, unique: true|
| nickname            | string   | null: false              |
| birthday            | string   | null: false              |

### Association
* has_many :items
* has_many :records




##　items テーブル

|Column           |Type        |Options            |
|-----------------|------------|-------------------|
| items_name      | string     | null: false       |
| price           | string     | null: false       |
| user            | references | foreign_key: true |
| category        | integer    | null: false       |
| condition       | integer    | null: false       |
| postage         | integer    | null: false       |
| shipment_area   | integer    | null: false       |
| shipping_date   | integer    | null: false       |



### Association
* belongs_to :user
* has_one    :record




## record テーブル

|Column  |Type        |Options            |
|--------|------------|-------------------|
| item   | references | foreign_key: true |
| user   | references | foreign_key: true |

### Association
* belongs_to :user
* belongs_to :item
* has_one :address




## address テーブル

|Column           |Type         |Options           |
|-----------------|-------------|------------------|
| postal_code     | integer     | null: false      |
| prefecture      | integer     | null: false      |
| city            | integer     | null: false      |
| house_number    | integer     | null: false      |
| building_number | integer     | null: false      |
| phone_number    | string      | null: false      |

### Association
*belongs_to  :user
*belongs_to  :record