class Users::HomeworksController < Users::BaseController
  def index
    @homeworks = lesson.homeworks
    @homework = lesson.homeworks.build
  end

  def new
    @homework = lesson.homeworks.build
  end

  def create
    @homework = lesson.homeworks.build(homework_params)

    if @homework.save
      flash[:notice] = 'Well done'
      redirect_to users_course_lesson_homeworks_path
    else
      flash[:notice] = "Field can't be empty"
      redirect_to users_course_lesson_homeworks_path
    end
  end

  private

  def course
    @course ||= Course.find(params[:course_id])
  end
  helper_method :course

  def lesson
    @lesson ||= Lesson.find(params[:lesson_id])
  end
  helper_method :lesson

  def homework_params
    params.require(:homework).permit(:task, :name)
  end
end
