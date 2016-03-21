class Users::CoursesController < Users::BaseController
  before_action :find_course, only: [:edit, :update, :destroy]

  PER_PAGE = 8

  def index
    @courses = current_user.authored_courses.page(params[:page]).per(params[:per_page] || PER_PAGE)
  end

  def new
    @course = current_user.authored_courses.build
  end

  def create
    @course = current_user.authored_courses.build(course_params)

    if (current_user.has_role? :trainer) && @course.save
      redirect_to users_courses_path
      flash[:notice] = 'Course has been successfully created'
    else
      render :new
      flash[:notice] = 'You are not a trainer'
    end
  end

  def edit
  end

  def update
    if (current_user.has_role? :trainer) && @course.update(course_params)
      redirect_to users_courses_path
      flash[:notice] = 'Course has been successfully updated'
    else
      render :edit
      flash[:notice] = 'You are not a trainer'
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
