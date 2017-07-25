class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :enpno
      t.string :password_digest
      t.string :remember_token

      t.timestamps
    end
  end
end


