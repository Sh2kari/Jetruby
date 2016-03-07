class Users::CourseDismissController < Users::BaseController
  before_filter :authenticate_user!

  def create
    course.bans << user
    course.course_users.where(user_id: user.id).first.destroy
  end

  private

  def course
    @course ||= Course.find(params[:course_id])
  end
  helper_method :course

  def user
    @user ||= User.find(params[:id])
  end
  helper_method :user
end
