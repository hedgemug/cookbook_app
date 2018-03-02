class RemoveImageFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :image, :string
  end
end
