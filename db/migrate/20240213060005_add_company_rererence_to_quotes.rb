class AddCompanyRererenceToQuotes < ActiveRecord::Migration[7.1]
  def change
    add_reference :quotes, :company, null: false
  end
end
