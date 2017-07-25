class AddAuthorityToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :authority, :string
  end
end
