module RestingPug
  # Defines everything related to subject basic operations(creation, updating etc)
  # @used_in {Base.included}
  module Subject
    protected

    # Gets a subject model from a controller class name
    # @note Override this method if you want to use another model.
    # @used_in {#subject_model_sym}
    # @used_in {#subject_model_sym_plural}
    # @used_in {#create_subject}
    # @used_in {#fetch_subject}
    # @used_in {#fetch_subjects}
    # @used_in {Params#permitted_fields}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a subject_model to use Novel as a model
    #     def subject_model
    #       Novel
    #     end
    #   end
    def subject_model
      controller_name.classify.constantize
    end

    # Returns a symbol out of the subject model name
    # @note Override this method to get another root for params and JSON responses.
    # @use {#subject_model}
    # @used_in {Params#params_for_create}
    # @used_in {Params#params_for_update}
    # @used_in {Render#render_subject}
    # @used_in {Render#render_param_missing}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a subject_model to use :novel as a symbol used in params and rendering
    #     def subject_model_sym
    #       :novel
    #     end
    #   end
    def subject_model_sym
      subject_model.to_s.underscore.to_sym
    end

    # Returns a symbol out of the subject model name(plural)
    # @note Override this method to get another root JSON response.
    # @use {#subject_model}
    # @used_in {Render#render_subjects}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a subject_model_sym_plural to use :novels as a symbol used in index action
    #     def subject_model_sym_plural
    #       :novels
    #     end
    #   end
    def subject_model_sym_plural
      subject_model.to_s.pluralize.underscore.to_sym
    end

    # Creates a subject
    # @note Override this method to add some custom logic to creating process.
    # @used_in {Chains#create_chain}
    # @use {#subject_model}
    # @use {Params#params_for_create}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a create_subject to create only if title is not 'None'
    #     def create_subject
    #       @subject = subject_model.create(params_for_create) unless params_for_create[:title] == 'None'
    #     end
    #   end
    def create_subject
      @subject = subject_model.create(params_for_create)
    end

    # Updates a subject
    # @note Override this method to add some custom logic to updating process.
    # @used_in {Chains#update_chain}
    # @use {Params#params_for_update}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a update_subject to update only if title is not 'None'
    #     def update_subject
    #       @subject.update(params_for_update) unless params_for_update[:title] == 'None'
    #     end
    #   end
    def update_subject
      @subject.update(params_for_update)
    end

    # Destroys a subject and render nothing or errors
    # @note Override this method to add some custom logic to destroying process.
    # @used_in {Chains#destroy_chain}
    # @use {Render#render_nothing}
    # @use {Render#render_errors}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a destroy_subject to destroy only if title is not 'None'
    #     def destroy_subject
    #       if @subject.title != 'None' && @subject.destroy
    #         render_nothing
    #       else
    #         render_errors
    #       end
    #     end
    #   end
    def destroy_subject
      if @subject.destroy
        render_nothing
      else
        render_errors
      end
    end

    # Finds a subject by id
    # @note Override this method to add some custom logic to fetching process.
    # @used_in {Chains#create_chain}
    # @used_in {Chains#update_chain}
    # @used_in {Chains#destroy_chain}
    # @used_in {Chains#show_chain}
    # @use {#subject_model}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a fetch_subject to return a default subject if requested is not found
    #     def fetch_subject
    #       @subject = subject_model.find_by_id(params[:id]) || default_subject
    #     end
    #   end
    def fetch_subject
      @subject = subject_model.find(params[:id])
    end

    # Returns all subjects accessable for API
    # @note Override this method to add some custom logic to fetching process.
    # @used_in {Chains#index_chain}
    # @use {#subject_model}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a fetch_subjects to return subject where title is not 'None'
    #     def fetch_subjects
    #       @subjects = subject_model.where.not(title: 'None')
    #     end
    #   end
    def fetch_subjects
      @subjects = subject_model.all
    end
  end
end