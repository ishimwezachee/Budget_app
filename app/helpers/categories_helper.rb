module CategoriesHelper
  def example_img(category)
    img_example = 'https://i.ibb.co/syp5dN2/default.png'
    if category.icon.present? and category.icon.last(4) == '.png'
      category.icon
    else
      img_example
    end
  end
end
