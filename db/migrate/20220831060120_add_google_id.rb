class AddGoogleId < ActiveRecord::Migration[5.0]
    def change
      add_column :users, :google_id, :string, :default => nil
    end
  end