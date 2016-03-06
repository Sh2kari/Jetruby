class LessonsController < ApplicationController
  before_filter :load_lesson, only: [:show, :edit, :update, :destroy]

  PER_PAGE = 4

  def index
    @lessons = course.lessons.order(sort_column + ' ' + sort_direction).where(hidden: false).page(params[:page]).per(params[:per_page] || PER_PAGE)
  end

  def show
  end

  def new
    @lesson = course.lessons.build
  end

  def create
    @lesson = course.lessons.build(lesson_params)

    if @lesson.save
      redirect_to course_lessons_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      flash[:success] = 'Lesson was updated.'
      redirect_to users_course_lessons_path
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy

    redirect_to course_lessons_path
  end

  private

  def course
    @course ||= Course.find(params[:course_id])
  end
  helper_method :course

  def load_lesson
    @lesson = course.lessons.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :position, :description, :cover, :summary, :homework, :hidden)
  end

  def sort_column
    Lesson.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end
  helper_method :sort_direction

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
  helper_method :sort_column
end
