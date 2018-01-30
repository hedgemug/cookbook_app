class RemoveChefFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :chef, :string
  end
end
