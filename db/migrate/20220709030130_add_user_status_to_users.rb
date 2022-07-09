class AddUserStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :usre_status, :integer
  end
end
