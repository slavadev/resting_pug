module RestingPug
  # Describes chains of methods for actions. Each chain is an array of methods running one by one.
  # @used_in {Base.included}
  module Chains
    protected

    # Creates a chain of methods for creating a subject
    # @note Override this method to add or remove methods executed while creating a subject
    # @used_in {Actions#create}
    # @use {Subject#create_subject}
    # @use {Render#decide_what_to_render}
    def create_chain
      [:create_subject, :decide_what_to_render]
    end

    # Creates a chain of methods for updating a subject
    # @note Override this method to add or remove methods executed while updating a subject
    # @used_in {Actions#update}
    # @use {Subject#fetch_subject}
    # @use {Subject#update_subject}
    # @use {Render#decide_what_to_render}
    def update_chain
      [:fetch_subject, :update_subject, :decide_what_to_render]
    end

    # Creates a chain of methods for deleting a subject
    # @note Override this method to add or remove methods executed while deleting a subject
    # @used_in {Actions#destroy}
    # @use {Subject#fetch_subject}
    # @use {Subject#destroy_subject}
    def destroy_chain
      [:fetch_subject, :destroy_subject]
    end

    # Creates a chain of methods for showing a subject
    # @note Override this method to add or remove methods executed while showing a subject
    # @used_in {Actions#show}
    # @use {Subject#fetch_subject}
    # @use {Render#render_subject}
    def show_chain
      [:fetch_subject, :render_subject]
    end

    # Creates a chain of methods for showing a list of subjects
    # @note Override this method to add or remove methods executed while showing a list of subjects
    # @used_in {Actions#index}
    # @use {Subject#fetch_subjects}
    # @use {Modificators#filter_subjects}
    # @use {Modificators#sort_subjects}
    # @use {Modificators#paginate_subjects}
    # @use {Render#render_subjects}
    def index_chain
      [:fetch_subjects, :filter_subjects, :sort_subjects, :paginate_subjects, :render_subjects]
    end
  end
end