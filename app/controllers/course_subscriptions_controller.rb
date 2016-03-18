class CourseSubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def update
    course.participants << current_user
  end

  def destroy
    course.course_users.where(user_id: current_user).first.destroy
  end

  def dismiss
    course.course_users.find_by_user_id(params[:user_id]).update_attribute(:dismiss, false)
  end

  private

  def course
    @course ||= Course.find(params[:course_id])
  end
  helper_method :course

  def user
    @user ||= User.find(params[:user_id])
  end
  helper_method :user
end
