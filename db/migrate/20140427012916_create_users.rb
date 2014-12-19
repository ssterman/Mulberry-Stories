class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string 	:first_name
    	t.string	:last_name
    	t.string	:username
    	t.string	:password_digest
    	t.string	:salt
        t.integer   :test_group

    	    #add_column :users, :first_name, :string
    #add_column :users, :last_name, :string
    #add_column :users, :login, :string
    #add_column :users, :password_digest, :string
    #add_column :users, :salt, :string
      	t.timestamps
    end
  end
end
