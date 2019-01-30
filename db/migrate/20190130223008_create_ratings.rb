class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.belongs_to :tip
      t.belongs_to :user 
      t.integer :stars
      t.timestamps
    end
  end
end
