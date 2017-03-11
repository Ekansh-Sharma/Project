class Product < ActiveRecord::Base
  validates_presence_of :sku_id
  validates :sku_id, uniqueness: true
end
