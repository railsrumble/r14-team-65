class Gist < ActiveRecord::Base
  belongs_to :user
  has_many :gist_files
  
  acts_as_taggable
end


