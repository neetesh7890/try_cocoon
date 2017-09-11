class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      t.string :gender
      t.date :dob
      t.string :avatar


      t.timestamps null: false
    end
  end
end
