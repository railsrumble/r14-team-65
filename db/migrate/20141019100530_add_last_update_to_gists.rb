class AddLastUpdateToGists < ActiveRecord::Migration
  def change
    add_column :gists, :last_update, :datetime
  end
end
