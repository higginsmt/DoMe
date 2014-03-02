class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :body
      t.references :user, index: true
      t.references :adventure, index: true
      t.references :activity, index: true

      t.timestamps
    end
  end
end
