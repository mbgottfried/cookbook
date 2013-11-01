class ChangeIngredientsToText < ActiveRecord::Migration
  def up
  	change_column :recipes, :ingredients, :text
  end

  def down
  	change_column :recipes, :ingredients, :string
  end

end
