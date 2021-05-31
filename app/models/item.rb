class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :concept_category
  belongs_to :concept_status
  belongs_to :delivery_area
  belongs_to :delivery_charge
  belongs_to :delivery_day
end
