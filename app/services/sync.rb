class Sync
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def perform
    clean!
    delete_files!
    update!
  end

  private

  def github
    @github ||= Github.new oauth_token: user.token
  end

  def gists
    @gists ||= github.gists.list
  end

  def get_gist(id)
    github.gists.get(id)
  end

  def clean!
    user.gists.where.not(github_id: gists.map(&:id)).destroy_all
  end

  def delete_files!
    user.gists.map(&:gist_files).map(&:destroy_all)
  end

  def update!
    gists.each do |gist|
      _ = Gist.find_or_create_by(github_id: gist.id, user_id: user.id)
      _.update(description: gist.description)
      get_gist(gist.id).files.each do |name, info|
        _.gist_files.create(name: name, raw_content: info.content)
        _.tag_list.add((info.language || '').downcase)
        _.save
      end
    end
  end

end
