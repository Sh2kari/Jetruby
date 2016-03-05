class Users::LessonsController < Users::BaseController
  PER_PAGE = 4

  def index
    @lessons = course.lessons.page(params[:page]).per(params[:per_page] || PER_PAGE)
  end

  def course
    @course = current_user.authored_courses.find(params[:course_id])
  end
  helper_method :course
end
