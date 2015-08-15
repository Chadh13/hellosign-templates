class AddDataToTemplates < ActiveRecord::Migration
  def change
      add_column :templates, :hellosign_id, :string
      add_column :templates, :edit_url, :string
      add_column :templates, :embedded_draft, :string
  end
end