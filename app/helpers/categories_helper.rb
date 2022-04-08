module CategoriesHelper
    def example_img(category)
        img_example = '/assets/default.png'
        if category.icon.present? and category.icon.last(4) == ".png"
            category.icon
        else
            img_example
        end
      end
end
