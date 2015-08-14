class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.belongs_to :user, index:true
      t.string :title
      t.string :subject
      t.text :message
      t.string :file

      t.timestamps null: false
    end
  end
end