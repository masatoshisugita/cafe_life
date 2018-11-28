class RenameNameColumnToTopics < ActiveRecord::Migration[5.2]
  def change
    rename_column :topics, :name, :cafe_name
  end
end
