class Users::CoursesController < Users::BaseController
  before_action :find_course, only: [:edit, :update, :destroy]

  PER_PAGE = 8

  def index
    @courses = current_user.authored_courses.recent.page(params[:page]).per(params[:per_page] || PER_PAGE).includes(:user)
  end

  def new
    @course = current_user.authored_courses.build
  end

  def create
    @course = current_user.authored_courses.build(course_params)

    if @course.save
      redirect_to users_courses_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to users_courses_path
    else
      render :edit
    end
  end

  def destroy
    @course.destroy

    redirect_to users_courses_path
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :cover)
  end

  def find_course
    @course = current_user.authored_courses.find(params[:id])
  end
end
