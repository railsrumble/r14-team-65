class ChangeGithubIdGistsColumn < ActiveRecord::Migration
  def change
    change_column :gists, :github_id, :string
  end
end
