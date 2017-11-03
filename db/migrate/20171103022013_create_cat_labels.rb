class CreateCatLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :cat_labels do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
