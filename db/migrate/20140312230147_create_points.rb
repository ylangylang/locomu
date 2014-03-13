class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :user,                 null: false
      t.references :user_photo,           null: false
      t.integer :value,                   null: false, default: 0
      t.integer :color
      t.string :comment

      t.timestamps
    end
  end
end
