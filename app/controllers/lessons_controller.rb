class LessonsController < ApplicationController
  include SortHelper
  authorize_resource

  before_filter :load_lesson, only: :show

  PER_PAGE = 4

  def index
    if current_user.participate_in?(course)
      @lessons = course.lessons.visible.order(order_string).page(params[:page]).per(params[:per_page] || PER_PAGE)
    else
      not_subscribed
    end
  end

  def show
  end

  private

  helper_method :sort_column
  helper_method :sort_direction

  def order_string
    sort_column + ' ' + sort_direction
  end

  def course
    @course ||= Course.find(params[:course_id])
  end
  helper_method :course

  def load_lesson
    authorize! :show, @lessons
    @lesson = course.lessons.find(params[:id])
  end

  def lesson
    @lesson ||= Lesson.find(params[:lesson_id])
  end
  helper_method :lesson
end
