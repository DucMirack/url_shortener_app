class CreateShortenedUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :shortened_urls do |t|
      t.string :key, unique: true, null: false
      t.string :full_url, null: false

      t.timestamps
    end
  end
end
