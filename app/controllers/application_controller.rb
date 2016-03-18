class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def sort_column
    Lesson.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end
  helper_method :sort_column

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
  end
  helper_method :sort_direction
end
