class AddUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name 
      t.string :password_digest
      t.string :email
      t.boolean :has_graduated
      t.timestamps
    end 
  end
end

#User has many tips 
#User has many lesson_topics, through tips
#lesson_topics has many tips
#lesson_topics has many users, through tips 
#tips belong to user 
#tips belong to lesson_topic 

#tips have many ratings
#tips has many users, through ratings 
#user has many ratings 
#user has many tips through ratings
#ratings belong to tip
#rating belongs to user