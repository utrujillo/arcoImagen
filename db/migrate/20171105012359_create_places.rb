class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :direccion
      t.float :latitude
      t.float :longitude
      t.string :descripcion_corta
      t.string :descripcion_larga

      t.timestamps
    end
  end
end
