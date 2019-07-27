class UpdateIndexForShortenedUrl < ActiveRecord::Migration[5.2]
  def change

    remove_index :shortened_urls, name: 'index_shortened_urls_on_long_url'
  end
end
