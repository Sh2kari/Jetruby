class Users::LessonsController < Users::BaseController
  include SortHelper

  before_filter :load_lesson, only: [:show, :edit, :update, :destroy]

  PER_PAGE = 4

  def index
    @lessons = course.lessons.order(order_string).page(params[:page]).per(params[:per_page] || PER_PAGE)
  end

  def show
  end

  def new
    @lesson = course.lessons.build
  end

  def create
    @lesson = course.lessons.build(lesson_params)

    if @lesson.save
      redirect_to users_course_lessons_path
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

    redirect_to users_course_lessons_path
  end

  private

  helper_method :sort_column
  helper_method :sort_direction

  def order_string
    sort_column + ' ' + sort_direction
  end

  def course
    @course ||= current_user.authored_courses.find(params[:course_id])
  end
  helper_method :course

  def load_lesson
    @lesson = course.lessons.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :position, :description, :cover, :summary, :homework, :hidden)
  end
end
