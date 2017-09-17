module SimpleRestAPI
  module Render
    protected

    def decide_what_to_render
      if @subject.valid?
        render_subject
      else
        render_errors
      end
    end

    def render_subject
      render json: { subject_model_sym => @subject.as_json(only: permitted_fields_for_show) }
    end

    def render_subjects
      render json: { subject_model_sym_plural => @subjects.as_json(only: permitted_fields_for_show) }
    end

    def render_nothing
      render json: {}, status: 204
    end

    def render_errors
      render json: { errors: @subject.errors }, status: 422
    end

    def render_param_missing
      render json: { errors: { subject_model_sym => ['param is missing'] } }, status: 400
    end

    def render_not_found
      render json: {}, status: 404
    end
  end
end