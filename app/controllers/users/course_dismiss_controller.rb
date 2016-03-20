class Users::CourseDismissController < Users::BaseController
  before_filter :authenticate_user!

  def create
    course.course_users.find_by_user_id(params[:user_id]).update_attribute(:dismiss, false)
  end

  private

  def course
    @course ||= current_user.authored_courses.find(params[:course_id])
  end
  helper_method :course

  def user
    @user ||= User.find(params[:user_id])
  end
  helper_method :user
end
