class CreateSightings < ActiveRecord::Migration[7.1]
  def change
    create_table :sightings do |t|
      t.references :animal, null: false, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.date :date

      t.timestamps
    end
  end
end
