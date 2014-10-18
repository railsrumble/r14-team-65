class User < ActiveRecord::Base

  has_many :gists

  has_many :tags, through: :gists
  has_many :gist_files, through: :gists


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.login = auth['extra']['raw_info']['login']
      user.token = auth['credentials']['token']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end
