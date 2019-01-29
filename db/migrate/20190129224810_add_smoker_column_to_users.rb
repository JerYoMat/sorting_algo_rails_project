class AddSmokerColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :smoker, :boolean
    add_column :users, :cigs_per_day, :integer
  end
end
