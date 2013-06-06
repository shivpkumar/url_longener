class AddRefToUrlTable < ActiveRecord::Migration
  def change
    change_table :urls do |t|
      t.references :user
    end
  end
end
