class AddCulumnToMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :topic_id, :integer
  end
end
