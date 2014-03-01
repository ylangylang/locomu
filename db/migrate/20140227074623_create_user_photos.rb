class CreateUserPhotos < ActiveRecord::Migration
  def change
    create_table :user_photos do |t|
      t.references :user,           null: false

      t.string :file_name,          null: false, default: ""
      t.string :content_type,       null: false, default: ""
      t.string :title
      t.string :comment
      t.integer :total_size,        null: false, default: 0

      t.timestamps
    end
  end
end
