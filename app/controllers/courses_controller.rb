class CoursesController < ApplicationController
  PER_PAGE = 8

  def index
    @courses = Course.page(params[:page]).per(params[:per_page] || PER_PAGE)
  end
end
