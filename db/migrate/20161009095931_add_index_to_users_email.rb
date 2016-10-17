class AddIndexToUsersEmail < ActiveRecord::Migration[5.0]
  def change
    # add index to email field of table users.
    add_index :users, :email, unique: true
  end
end
