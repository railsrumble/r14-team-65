class CreateGistFiles < ActiveRecord::Migration
  def change
    create_table :gist_files do |t|
      t.references :gist, index: true

      t.timestamps
    end
  end
end
