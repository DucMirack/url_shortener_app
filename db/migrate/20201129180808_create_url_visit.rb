class CreateUrlVisit < ActiveRecord::Migration[6.1]
  def change
    create_table :url_visits do |t|
      t.references :url, null: false, index: true

      t.timestamps
    end
  end
end
