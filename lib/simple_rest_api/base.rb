module SimpleRestAPI
  module Base
    def self.included(base)
      base.class_eval do
        rescue_from ActionController::ParameterMissing, with: :render_param_missing
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
        before_action :fetch_subject, only: [:update, :destroy, :show]

        def create
          subject = subject_model.create(params_for_create)
          if subject.valid?
            render_subject(subject)
          else
            render_errors(subject)
          end
        end

        def update
          if @subject.update(params_for_update)
            render_subject(@subject)
          else
            render_errors(@subject)
          end
        end

        def destroy
          if @subject.destroy
            render_nothing
          else
            render_errors(@subject)
          end
        end

        def show
          render_subject(@subject)
        end

        protected

        # SUBJECT MODEL
        def subject_model
          controller_name.classify.constantize
        end

        def subject_model_sym
          subject_model.to_s.underscore.to_sym
        end

        def fetch_subject
          @subject = subject_model.find(params[:id])
        end

        # PERMITTED FIEDS
        def permitted_fields
          subject_model.column_names.map(&:to_sym)
        end

        def permitted_fields_for_show
          permitted_fields
        end

        def permitted_fields_for_create
          permitted_fields - [:id, :created_at, :updated_at]
        end

        def permitted_fields_for_update
          permitted_fields - [:id, :created_at, :updated_at]
        end

        # PARAMS
        def params_for_create
          params.require(subject_model_sym).permit(permitted_fields_for_create)
        end

        def params_for_update
          params.require(subject_model_sym).permit(permitted_fields_for_update)
        end

        # RENDER
        def render_subject(subject)
          render json: { subject_model_sym => subject.as_json(only: permitted_fields_for_show) }
        end

        def render_nothing
          render json: {}, status: 204
        end

        def render_errors(subject)
          render json: { errors: subject.errors }, status: 422
        end

        def render_param_missing(error)
          render json: { errors: { subject_model_sym => ['param is missing'] } }, status: 400
        end

        def render_not_found
          render json: {}, status: 404
        end
      end
    end
  end
end