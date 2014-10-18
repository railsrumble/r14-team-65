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

  def clean!
    user.gists.where.not(github_id: gists.map(&:id)).destroy_all
  end

  def delete_files!
    user.gists.map(&:gist_files).map(&:destroy_all)
  end

  def update!
    gists.each do |gist|
      user.gists.find_or_create_by(github_id: gist.id) do |_|
        gist.files.each do |name, info|
          _.gist_files.build(name: name)
        end
      end
    end
  end

end
