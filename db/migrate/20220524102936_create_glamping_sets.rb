class CreateGlampingSets < ActiveRecord::Migration[7.0]
  def change
    create_table :glamping_sets do |t|
      t.string :name
      t.text :description
      t.integer :total_occupancy
      t.float :price_per_night
      t.string :photo_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
