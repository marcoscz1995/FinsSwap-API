module Api
  module V1
    class ExamsController < ApplicationController
      def index
        exams = Exam.all

        render json: ExamSerializer.new(exams).serialized_json
      end

      def show
        exam = Exam.find_by(course_code: params[:course_code])

        render json: ExamSerializer.new(exam).serialized_json
      end

    end
  end
end
