class AddOwnerAvatarToGists < ActiveRecord::Migration
  def change
    add_column :gists, :owner_avatar, :string
  end
end
