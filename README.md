# README

## users　テーブル

|Column               |Type      |Options                   |
|---------------------|----------|--------------------------|
| encrypted_password  | string   | null: false              |
| email               | string   | null: false, unique: true|
| nickname            | string   | null: false              |
| birthday            | date     | null: false              |
| first_name          | string   | null: false              |
| last_name           | string   | null: false              | 
| first_name_kana     | string   | null: false              |
| last_name_kana      | string   | null: false              |

### Association
* has_many :items
* has_many :records




##　items テーブル

|Column              |Type        |Options            |
|--------------------|------------|-------------------|
| items_name         | string     | null: false       |
| price              | integer    | null: false       |
| content            | text       | null: false       |
| user               | references | foreign_key: true |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| postage_id         | integer    | null: false       |#送料
| shipment_area_id   | integer    | null: false       |
| shipping_date_id   | integer    | null: false       |




### Association
* belongs_to :user
* has_one    :record




## records テーブル

|Column  |Type        |Options            |
|--------|------------|-------------------|
| item   | references | foreign_key: true |
| user   | references | foreign_key: true |

### Association
* belongs_to :user
* belongs_to :item
* has_one :address




## addresses テーブル

|Column           |Type         |Options           |
|-----------------|-------------|------------------|
| postal_code     | string      | null: false      |
| shipment_area_id| integer     | null: false      |
| city            | string      | null: false      |#市町村
| house_number    | string      | null: false      |#住所
| building_name   | string      |                  |
| phone_number    | string      | null: false      |
| record          | references  | foreign_key: true|

### Association

*belongs_to  :record