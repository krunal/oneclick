class CreateAttachmentTable < ActiveRecord::Migration
  def change
    create_table(:attachments) do |t|
      t.string :file_object 
      t.string :filename
      t.string :description
      t.integer :user_id
      
      t.timestamps
    end
  end
end
