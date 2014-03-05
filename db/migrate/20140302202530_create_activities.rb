class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :name
      t.text :blurb
      t.text :url
      t.text :things_needed
      t.text :map
      t.references :user, index: true

      t.timestamps
    end
  end
end
