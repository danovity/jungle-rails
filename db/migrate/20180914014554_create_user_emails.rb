class CreateUserEmails < ActiveRecord::Migration
  def change
    create_table :user_emails do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps null: false
    end
  end
end
