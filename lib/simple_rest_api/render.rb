module SimpleRestAPI
  # Contains methods responsible for rendering response
  # @used_in {Base.included}
  module Render
    protected

    # Calls {#render_subject} if subject is valid and {#render_errors} otherwise
    # @note Override {#render_subject} and {#render_errors} to change rendering behaviour
    # @used_in {Chains#create_chain}
    # @used_in {Chains#update_chain}
    # @use {#render_subject}
    # @use {#render_errors}
    def decide_what_to_render
      if @subject.valid?
        render_subject
      else
        render_errors
      end
    end

    # Renders json with a subject
    # @note Override this method to add more complicated logic of rendering.
    #   Override {Subject#subject_model_sym} to change root attribute.
    #   Override {Params#permitted_fields_for_show} to change shown attributes.
    # @used_in {#decide_what_to_render}
    # @used_in {Chains#show_chain}
    # @use {Subject#subject_model_sym}
    # @use {Params#permitted_fields_for_show}
    def render_subject
      render json: { subject_model_sym => @subject.as_json(only: permitted_fields_for_show) }
    end

    # Renders json with subjects
    # @note Override this method to add more complicated logic of rendering.
    #   Override {Subject#subject_model_sym_plural} to change root attribute.
    #   Override {Params#permitted_fields_for_show} to change shown attributes.
    # @used_in {Chains#index_chain}
    # @use {Subject#subject_model_sym_plural}
    # @use {Params#permitted_fields_for_show}
    def render_subjects
      render json: { subject_model_sym_plural => @subjects.as_json(only: permitted_fields_for_show) }
    end

    # Renders empty response
    # @note Override this method to add more complicated logic of rendering.
    # @used_in {Subject#destroy_subject}
    def render_nothing
      render json: {}, status: 204
    end

    # Renders errors
    # @note Override this method to add more complicated logic of rendering.
    # @used_in {#decide_what_to_render}
    def render_errors
      render json: { errors: @subject.errors }, status: 422
    end

    # Renders error when required params are missing
    # @note Override this method to add more complicated logic of rendering.
    # @used_in {Base.included}
    def render_param_missing
      render json: { errors: { subject_model_sym => ['param is missing'] } }, status: 400
    end

    # Renders error when required params are missing
    # @note Override this method to add more complicated logic of rendering.
    # @used_in {Base.included}
    def render_not_found
      render json: {}, status: 404
    end
  end
end