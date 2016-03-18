class Users::LessonsController < Users::BaseController
  PER_PAGE = 4

  def index
    @lessons = course.lessons.order(order_string).page(params[:page]).per(params[:per_page] || PER_PAGE)
  end

  private

  def order_string
    sort_column + ' ' + sort_direction
  end

  def course
    @course = Course.find(params[:course_id])
  end
  helper_method :course
end
