class Gist < ActiveRecord::Base
  belongs_to :user
  has_many :gist_files, dependent: :destroy, autosave: true

  acts_as_taggable

  def forked?
    fork_url.present?
  end

  def title
  	description || gist_files.first.name
  end
end


