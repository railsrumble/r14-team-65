class SyncsController < ApplicationController
  respond_to :js

  def create
    Sync.new(current_user).perform
    @user = current_user.reload
    respond_with @user
  end

end
