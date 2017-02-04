class CreateMailContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :mail_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :message
      t.boolean :sent, default: false

      t.timestamps
    end
  end
end
