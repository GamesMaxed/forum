class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :name
      t.timestamps

      t.belongs_to :category
    end
  end
end
