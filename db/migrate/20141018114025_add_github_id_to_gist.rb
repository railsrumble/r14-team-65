class AddGithubIdToGist < ActiveRecord::Migration
  def change
    add_column :gists, :github_id, :integer
  end
end
