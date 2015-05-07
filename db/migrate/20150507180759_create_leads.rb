class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
