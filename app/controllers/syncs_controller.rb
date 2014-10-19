class SyncsController < ApplicationController
  respond_to :js

  def create
    # Sync.new(current_user).perform
    respond_with true
  end

end
