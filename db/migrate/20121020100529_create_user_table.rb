class CreateUserTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.timestamps
    end
    add_index :users, :name, unique: true
  end

  def down
    drop_table :users
  end
end