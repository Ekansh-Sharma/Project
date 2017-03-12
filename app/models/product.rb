class Product < ActiveRecord::Base
  validates_presence_of :sku_id
  validates :sku_id, uniqueness: true
  # scope :category_search, ->(val) { where("'#{val}' = ANY (categories)") }
  # scope :tag_search, ->(val) { where("'#{val}' = ANY (tags)") }
  before_save :remove_blank_vales

  private
  def remove_blank_vales
    categories.delete_if(&:blank?)
    tags.delete_if(&:blank?)
  end
end
