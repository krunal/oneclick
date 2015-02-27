# This migration comes from aadhar (originally 20150227220755)
class CreateAuthenticationTokens < ActiveRecord::Migration
  def change
    create_table :authentication_tokens do |t|
    	t.integer :user_id
    	t.string  :token
    	t.timestamps null: false
    end
  end
end
