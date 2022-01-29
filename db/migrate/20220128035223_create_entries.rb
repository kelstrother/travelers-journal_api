class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :galaxy
      t.string :region
      t.string :glyphs
      t.string :planets
      t.string :dominant_lifeform
      t.string :economy
      t.string :conflict_level
      t.text :notes

      t.timestamps
    end
  end
end
