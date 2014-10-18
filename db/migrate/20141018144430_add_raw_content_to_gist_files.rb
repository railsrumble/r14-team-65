class AddRawContentToGistFiles < ActiveRecord::Migration
  def change
    add_column :gist_files, :raw_content, :text
  end
end
