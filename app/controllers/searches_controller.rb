class SearchesController < ApplicationController
  respond_to :json

  def index
    @user ||= current_user
    @gists = search(params[:query])
    respond_with @gists
  end

  private

  def tag_list(query)
    @user.tags.where("name ILIKE ?", "%#{query}%").map(&:name).flatten.uniq
  end

  def results_by_tag(query)
    @user.gists.tagged_with(tag_list(query))
  end

  def results_by_description(query)
    @user.gists.where("description ILIKE ?", "%#{query}%")
  end

  def results_by_content(query)
    @user.gist_files.where("raw_content ILIKE ?", "%#{query}%").map(&:gist)
  end

  def search(query)
    if query.empty?
      @user.gists
    else
      (results_by_description(query) + results_by_tag(query) + results_by_content(query)).flatten.uniq
    end
  end
end
