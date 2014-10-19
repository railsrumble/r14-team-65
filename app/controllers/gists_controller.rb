class GistsController < ApplicationController
  respond_to :html, :js, :json

  def update
    @gist = Gist.find(params[:id])
    @gist.update(gist_params)

    respond_with @gist
  end

  def show
    @gist = Gist.find(params[:id])
  end

  def updatetags
    @gist = Gist.find(params[:id])
    tags = @gist.tag_list
    @gist.tag_list.remove(tags)
    @gist.tag_list.add(params[:tag_list])
    @gist.save
    respond_with @gist
  end

  private

  def gist_params
    params.require(:gist).permit(:id, :tag_list)
  end
end
