class Sync
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def perform
    clean!
    delete_files!
    update!(my_gists)
    update!(starred_gists)
  end

  private

  def github
    @github ||= Github.new oauth_token: user.token
  end

  def my_gists
    @my_gists ||= github.gists.list
  end

  def starred_gists
    @starred_gists ||= github.gists.starred
  end

  def get_gist(id)
    github.gists.get(id)
  end

  def all_gists
    my_gists.map(&:id) + starred_gists.map(&:id)
  end

  def clean!
    user.gists.where.not(github_id: all_gists).destroy_all
  end

  def delete_files!
    user.gists.map(&:gist_files).map(&:destroy_all)
  end

  def fork_url(gist)
    if gist.try :fork_of
      gist.fork_of.url
    end
  end

  def starred?(gist)
    gist.owner.login != user.login
  end

  def update!(collection)
    collection.each do |gist|
      current_gist = get_gist(gist.id)
      _ = Gist.find_or_create_by(github_id: gist.id, user_id: user.id)
      _.update(description: gist.description, url: gist.url, public: gist.public, last_update: gist.updated_at, owner_avatar: gist.owner.avatar_url, fork_url: fork_url(current_gist))
      current_gist.files.each do |name, info|
        _.gist_files.create(name: name, raw_content: info.content)
        _.tag_list.add((info.language || '').downcase)
        _.tag_list.add('starred') if starred?(gist)
        _.save
      end
    end
  end

end
