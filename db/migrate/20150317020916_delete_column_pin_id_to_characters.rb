class DeleteColumnPinIdToCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :pin_id
    add_column :pins, :character_id, :integer
  end
end
