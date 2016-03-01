class LessonsController < ApplicationController
  before_filter :load_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = course.lessons
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
      redirect_to course_lessons_path
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
    params.require(:lesson).permit(:title, :description)
  end
end
