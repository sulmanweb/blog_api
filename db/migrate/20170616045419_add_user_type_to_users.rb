class AddUserTypeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_type, :integer, default: Rails.configuration.constants['user_type_general']
  end
end
