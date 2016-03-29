class CourseSubscriptionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :current_user_dismissed

  def create
    course.participants << current_user
  end

  def destroy
    course.course_users.where(user_id: current_user).first.destroy
  end

  private

  def course
    @course ||= Course.find(params[:course_id])
  end
  helper_method :course

  def current_user_dismissed
    render :dismiss if current_user.try(:banned_in?, course)
  end
end
