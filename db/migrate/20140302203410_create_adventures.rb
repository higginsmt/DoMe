class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.references :user, index: true
      t.references :activity, index: true
      t.text :story
      t.date :date_completed

      t.timestamps
    end
  end
end
