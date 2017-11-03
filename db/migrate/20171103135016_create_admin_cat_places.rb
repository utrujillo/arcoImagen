class CreateAdminCatPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :cat_places do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
