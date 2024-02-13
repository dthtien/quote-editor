class AddCompanyRererenceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :company, null: false
  end
end
