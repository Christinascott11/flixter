class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_section


  def show
  end

   private

  def require_authorized_for_current_course
    if current_course.user != current_user
      redirect_to course_enrollments, alert: 'Error Message Here'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
