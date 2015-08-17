class CreateSignatureRequests < ActiveRecord::Migration
  def change
    create_table :signature_requests do |t|
      t.belongs_to :template, index: true
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end