class RemoveTextLimit < ActiveRecord::Migration
  def change
  	change_column :recipes, :ingredients, :text, :limit => nil
  end
end
