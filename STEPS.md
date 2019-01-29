# Steps and Notes 

#rails destroy is the opposite of rails generate

We can undo a single migration step using

  $ rails db:rollback
To go all the way back to the beginning, we can use

  $ rails db:migrate VERSION=0
