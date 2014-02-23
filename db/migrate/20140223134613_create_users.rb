class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, limit: 20, default: "", null: false
      t.string :last_name, limit: 20, default: "", null: false
      t.string :nickname, limit: 20, default: "", null: false
      t.boolean :use_nickname, :default => false, :null => false

      t.date :birthday
      t.integer :gender,        :default => 0, :null => false

      t.string :email_sub
      t.boolean :mail_notification, :default => false, :null => false
      t.boolean :admin, :default => false, :null => false
      t.integer :status, :default => 0, :null => false
      t.binary :avatar, limit: 1.megabytes

      t.timestamps
    end
  end
end
