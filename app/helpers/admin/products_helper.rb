module Admin::ProductsHelper
  def categories(categories)
    content_tag :ul do
      categories.each do |category|
        concat content_tag(:li, category)
      end
    end
  end

  def tags(tags)
    content_tag :ul do
      tags.each do |tag|
        concat content_tag(:li, tag)
      end
    end
  end

  def first_image(hash)
    hash.present? ? hash['0']['img_path'] : ''
  end

end
