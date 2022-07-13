class AddAge < ActiveRecord::Migration[5.0]
    def change
      add_column :users, :age, :string, :default => nil
    end
  end