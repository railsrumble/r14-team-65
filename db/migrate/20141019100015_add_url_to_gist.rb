class AddUrlToGist < ActiveRecord::Migration
  def change
    add_column :gists, :url, :string
  end
end
