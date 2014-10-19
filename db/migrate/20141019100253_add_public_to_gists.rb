class AddPublicToGists < ActiveRecord::Migration
  def change
    add_column :gists, :public, :boolean, default: true
  end
end
