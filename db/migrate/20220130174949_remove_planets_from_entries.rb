class RemovePlanetsFromEntries < ActiveRecord::Migration[6.1]
  def change
    remove_column :entries, :planets, :String
  end
end
