class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :name
      t.text :blurb
      t.text :url
      t.text :things_needed, array: true, default: []
      t.references :user, index: true

      t.timestamps
    end
  end
end
