# テーブル設計

## users テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| nickname      | string     | null: false |
| email         | string     | null: false |
| password      | string     | null: false |
| name          | string     | null: false |
| name_reading  | string     | null: false |
| birthday      | integer    | null: false |

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| image         |            |             |
| title         | string     | null: false |
| catch_copy    | text       | null: false |
| concept       | integer    | null: false |
| delivery      | integer    | null: false |
| price         | integer    | null: false |
| user          | references |             |


## purchases テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| user          | references |             |
| item          | references |             |

## shipping-address テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |             |
| telephone     | integer    | null: false |
| user          | references |             |
