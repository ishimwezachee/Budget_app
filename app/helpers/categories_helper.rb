module CategoriesHelper
  def example_img(category)
    img_example = 'https://cdn0.iconfinder.com/data/icons/simple-seo-and-internet-icons/512/budget_planning-512.png'
    if category.icon.present? and category.icon.last(4) == '.png' 
      category.icon
    else
      img_example
    end
  end
end
