class Users::SubscriptionCoursesController < Users::BaseController
  PER_PAGE = 8

  def index
    @courses = current_user.participated_courses.recent.page(params[:page]).per(params[:per_page] || PER_PAGE)
  end
end
