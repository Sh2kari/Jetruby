class Users::LessonsController < Users::BaseController
  PER_PAGE = 4

  def index
    @lessons = course.lessons.order(sort_column + ' ' + sort_direction).page(params[:page]).per(params[:per_page] || PER_PAGE)
  end

  private

  def course
    @course = current_user.authored_courses.find(params[:course_id])
  end
  helper_method :course

  def sort_column
    Lesson.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end
  helper_method :sort_direction

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
  end
  helper_method :sort_column
end
