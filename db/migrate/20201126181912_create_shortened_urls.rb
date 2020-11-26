class CreateShortenedUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :shortened_urls do |t|
      t.string :key, unique: true
      t.string :full_url

      t.timestamps
    end
  end
end
