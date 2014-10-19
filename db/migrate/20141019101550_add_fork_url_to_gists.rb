class AddForkUrlToGists < ActiveRecord::Migration
  def change
    add_column :gists, :fork_url, :string, default: nil
  end
end
