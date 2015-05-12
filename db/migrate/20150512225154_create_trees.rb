class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :name
      t.text :synonyms
      t.string :nicknames
      t.string :description
      t.string :habit
      t.string :exposure
      t.string :flowering_color
      t.string :blooming_period
      t.string :fruit_characteristics
      t.string :height
      t.string :width
      t.string :plant_character
      t.string :heat_tolerance
      t.string :water_requirements
      t.string :soil_requirements
      t.integer :usda_hardiness_zone
      t.timestamps null: false
    end
  end
end
