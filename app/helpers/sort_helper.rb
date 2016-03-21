module SortHelper
  def sort_column
    Lesson.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
