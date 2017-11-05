module RestingPug
  # Contains methods responsible for rendering response
  # @used_in {Base.included}
  module Render
    protected

    # Calls {#render_subject} if subject is valid and {#render_errors} otherwise
    # @note Override {#render_subject render_subject} and {#render_errors render_errors} to change rendering behaviour
    # @used_in {Chains#create_chain}
    # @used_in {Chains#update_chain}
    # @use {#render_subject}
    # @use {#render_errors}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a decide_what_to_render to render something special if @subject id is 3
    #     def decide_what_to_render
    #       if @subject.valid?
    #         @subject.id == 3 ? render_something_special : render_subject
    #       else
    #         render_errors
    #       end
    #     end
    #   end
    def decide_what_to_render
      if @subject.valid?
        render_subject
      else
        render_errors
      end
    end

    # Renders json with a subject
    # @note Override this method to add more complicated logic of rendering.
    #   Override {Subject#subject_model_sym subject_model_sym} to change root attribute.
    #   Override {Params#permitted_fields_for_show permitted_fields_for_show} to change shown attributes.
    # @used_in {#decide_what_to_render}
    # @used_in {Chains#show_chain}
    # @use {Subject#subject_model_sym}
    # @use {Params#permitted_fields_for_show}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a render_subject to render without a root object
    #     def render_subject
    #       render json: @subject.as_json(only: permitted_fields_for_show)
    #     end
    #   end
    def render_subject
      render json: { subject_model_sym => @subject.as_json(only: permitted_fields_for_show) }
    end

    # Renders json with subjects
    # @note Override this method to add more complicated logic of rendering.
    #   Override {Subject#subject_model_sym_plural subject_model_sym_plural} to change root attribute.
    #   Override {Params#permitted_fields_for_show permitted_fields_for_show} to change shown attributes.
    # @used_in {Chains#index_chain}
    # @use {Subject#subject_model_sym_plural}
    # @use {Params#permitted_fields_for_show}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a render_subjects to render with 'items' as a root object
    #     def render_subjects
    #       render json: { items: @subjects.as_json(only: permitted_fields_for_show) }
    #     end
    #   end
    def render_subjects
      render json: { subject_model_sym_plural => @subjects.as_json(only: permitted_fields_for_show) }
    end

    # Renders empty response
    # @note Override this method to add more complicated logic of rendering.
    # @used_in {Subject#destroy_subject}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a render_nothing to render with status 200
    #     def render_nothing
    #       render json: {}, status: 200
    #     end
    #   end
    def render_nothing
      render json: {}, status: 204
    end

    # Renders errors
    # @note Override this method to add more complicated logic of rendering.
    # @used_in {#decide_what_to_render}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a render_errors to render with status 400
    #     def render_errors
    #       render json: { errors: @subject.errors }, status: 400
    #     end
    #   end
    def render_errors
      render json: { errors: @subject.errors }, status: 422
    end

    # Renders error when required params are missing
    # @note Override this method to add more complicated logic of rendering.
    # @used_in {Base.included}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a render_param_missing to render with status 422
    #     def render_param_missing
    #       render json: { errors: { subject_model_sym => ['param is missing'] } }, status: 422
    #     end
    #   end
    def render_param_missing
      render json: { errors: { subject_model_sym => ['param is missing'] } }, status: 400
    end

    # Renders error when required params are missing
    # @note Override this method to add more complicated logic of rendering.
    # @used_in {Base.included}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a render_not_found to render with message 'Not found'
    #     def render_not_found
    #       render json: { message: 'Not found' }, status: 404
    #     end
    #   end
    def render_not_found
      render json: {}, status: 404
    end
  end
end