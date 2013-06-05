class CreateUrlTable < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original_url, :long_url_hash
    end
  end
end
