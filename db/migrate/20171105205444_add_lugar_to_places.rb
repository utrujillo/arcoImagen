class AddLugarToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :lugar, :string
  end
end
