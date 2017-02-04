class CreateMailContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :mail_contacts do |t|
      t.string :first_name, default: "", null:false
      t.string :last_name, default: "", null:false
      t.string :email, default: "", null:false
      t.string :phone, default: "", null:false
      t.text :message, default: "", null:false
      t.boolean :sent, default: false, null:false

      t.timestamps
    end
  end
end
