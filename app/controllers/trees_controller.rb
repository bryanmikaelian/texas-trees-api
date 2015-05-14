class TreesController < ApplicationController
  def index
    page = params[:page]
    per = params[:per_page] && params[:per_page].to_i > 100 ? 100 : params[:per_page] || 25
    @trees = Tree.page(page).per(per).order(name: :asc)

    respond_to do |format|
      format.html
      format.json { @trees }
    end
  end

  def search
    if params[:query]
      @trees = Tree.sunspot_search(params[:query], formatted_params)
    else
      @trees = []
    end
  end

  private

  def formatted_params
    {
      exposure: params[:exposure],
      blooming_period: params[:blooming_period],
      heat_tolerance: params[:heat_tolerance],
      water_requirements: params[:water_requirements],
      soil_requirements: params[:soil_requirements],
      min_usda_hardiness_zone: params[:min_usda_hardiness_zone],
      max_usda_hardiness_zone: params[:max_usda_hardiness_zone]
    }
  end
end
