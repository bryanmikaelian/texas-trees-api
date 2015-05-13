class TreesController < ApplicationController
  def index
    page = params[:page]
    per = params[:per_page] && params[:per_page].to_i > 100 ? 100 : params[:per_page] || 25
    @trees = Tree.page(page).per(per).order(name: :asc)
  end
end
