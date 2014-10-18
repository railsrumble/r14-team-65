class SyncsController < ApplicationController

  def create
    Sync.new(current_user).perform
    redirect_to user_path(current_user)
  end

end
