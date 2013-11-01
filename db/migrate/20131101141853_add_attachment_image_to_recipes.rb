class AddAttachmentImageToRecipes < ActiveRecord::Migration
  def self.up
    change_table :recipes do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :recipes, :image
  end
end
