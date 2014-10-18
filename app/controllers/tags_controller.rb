class TagsController < ApplicationController
  respond_to :json

  def index
    @tags = ActsAsTaggableOn::Tag.order(:name).where('name ILIKE ?', "%#{params['query']}%").all

    respond_with @tags
  end
end
