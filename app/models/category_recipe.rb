class CategoryRecipe < ApplicationRecord

  belongs_to :category
  belongs_to :recipe
end
