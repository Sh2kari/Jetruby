class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to root_path, notice: 'Successfully deleted course'
  end

  private

  def course_params
    params.require(:course).permit(:title, :description)
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
