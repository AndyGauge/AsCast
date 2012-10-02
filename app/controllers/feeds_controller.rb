class FeedsController < ApplicationController
  # GET /auths
  # GET /auths.json
  def index
   @feeds = Feed.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feeds }
    end
  end
end
