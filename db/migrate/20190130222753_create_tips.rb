class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.belongs_to :user 
      t.belongs_to :lesson_topic
      t.string :name 
      t.text :description 
      t.string :resource_link 
      t.string :user_outcome
      t.timestamps
    end
    add_index :tips, [:user_id, :created_at]
  end
end
