class CreateUrlVisit < ActiveRecord::Migration[6.1]
  def change
    create_table :url_visits do |t|
      t.references :shortened_url, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
