require 'will_paginate/active_record'

module SimpleRestAPI
  module Base
    def self.included(base)
      base.class_eval do
        rescue_from ActionController::ParameterMissing, with: :render_param_missing
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
        before_action :fetch_subject, only: [:update, :destroy, :show]
        before_action :fetch_subjects, :paginate_subjects, :order_subjects, only: [:index]

        def create
          @subject = subject_model.create(params_for_create)
          if @subject.valid?
            render_subject
          else
            render_errors
          end
        end

        def update
          if @subject.update(params_for_update)
            render_subject
          else
            render_errors
          end
        end

        def destroy
          if @subject.destroy
            render_nothing
          else
            render_errors
          end
        end

        def show
          render_subject
        end

        def index
          render_subjects
        end

        protected

        # SUBJECT MODEL
        def subject_model
          controller_name.classify.constantize
        end

        def subject_model_sym
          subject_model.to_s.underscore.to_sym
        end

        def subject_model_sym_plural
          subject_model.to_s.pluralize.underscore.to_sym
        end

        def fetch_subject
          @subject = subject_model.find(params[:id])
        end

        def fetch_subjects
          @subjects = subject_model.all
        end

        # MODIFICATIONS
        def paginate_subjects
          @subjects = @subjects.paginate(page: pagination_params[:page], per_page: pagination_params[:per_page])
        end

        def order_subjects
          @subjects = @subjects.order(:id)
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

        def pagination_params
          page = params[:page] || 1
          per_page = [per_page_range[:min], params[:per_page] || per_page_default, per_page_range[:max]].sort[1]
          return { page: page, per_page: per_page }
        end

        # PAGINATION
        def per_page_range
          { min: 5, max: 100 }
        end

        def per_page_default
          10
        end

        # RENDER
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
  end
end