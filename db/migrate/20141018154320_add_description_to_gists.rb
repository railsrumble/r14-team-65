class AddDescriptionToGists < ActiveRecord::Migration
  def change
    add_column :gists, :description, :string
  end
end
