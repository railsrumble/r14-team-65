class Gist < ActiveRecord::Base
  belongs_to :user
  has_many :gist_files, dependent: :destroy, autosave: true

  acts_as_taggable
end


