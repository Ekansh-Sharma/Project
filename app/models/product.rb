class Product < ActiveRecord::Base
  validates_presence_of :sku_id
  validates :sku_id, uniqueness: true
  # scope :category_search, ->(val) { where("'#{val}' = ANY (categories)") }
  # scope :tag_search, ->(val) { where("'#{val}' = ANY (tags)") }
end
