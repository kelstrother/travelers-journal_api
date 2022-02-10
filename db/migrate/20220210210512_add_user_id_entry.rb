class AddUserIdEntry < ActiveRecord::Migration[6.1]
  def change
    change_table :entries do |t|
      t.references :user, foreign_key: true
    end
  end
end
