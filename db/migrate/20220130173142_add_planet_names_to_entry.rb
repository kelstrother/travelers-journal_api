class AddPlanetNamesToEntry < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :planet_names, :text, array: true, default: []
  end
end
