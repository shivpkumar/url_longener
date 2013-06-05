class CreateUrlTable < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :full_url, :long_url
    end
  end
end
