class LessonsController < ApplicationController
  include SortHelper

  before_filter :load_lesson, only: [:show, :edit, :update, :destroy]

  PER_PAGE = 4

  def index
    @lessons = course.lessons.visible.order(order_string).page(params[:page]).per(params[:per_page] || PER_PAGE)
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
    @lesson = course.lessons.find(params[:id])
  end

  def lesson
    @lesson ||= Lesson.find(params[:lesson_id])
  end
  helper_method :lesson
end
