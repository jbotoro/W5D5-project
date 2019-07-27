class CreateShortenedUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url
      t.string :long_url, null: false
      t.integer :user_id, null: false
      
      t.timestamps

      t.index :short_url 
      t.index :long_url, unique: true
    end
  end
end
