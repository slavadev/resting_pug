module RestingPug
  # Describes basic CRUD actions.
  # Each action is represented by a chain of methods definied in {Chains} module.
  # @see https://en.wikipedia.org/wiki/Create,_read,_update_and_delete
  # @used_in {Base.included}
  module Actions
    # Creates a subject with attributes from params and returns it.
    # @example
    #   Request:
    #   POST http://your.awesome/api/books
    #   {
    #     "name": "11/22/63",
    #     "author": "Stephen King"
    #   }
    #
    #   Response:
    #   200 OK
    #   {
    #     "book": {
    #       "id": 1,
    #       "name": "11/22/63",
    #       "author": "Stephen King"
    #     }
    #   }
    # @note You can sustomize creating action:
    #   - override {Params#permitted_fields_for_create permitted_fields_for_create} to set which params can be set in a new subject
    #   - override {Params#permitted_fields_for_show permitted_fields_for_show} to set which params will be shown in response
    #   - override {Render#render_subject render_subject} to set how subject will be rendered
    #   - override {Render#render_errors render_errors} to set how errors will be rendered
    #   - override {Subject#subject_model subject_model} to set what model will be created
    #   - override {Chains#create_chain create_chain} to add or remove methods which will be called while creating a subject
    #   - override {Render#decide_what_to_render decide_what_to_render} to set how it will be decided what to render in response
    # @use {#run_chain}
    # @use {Chains#create_chain}
    def create
      run_chain(create_chain)
    end

    # Updates a subject by id with attributes from params and returns it.
    # @example
    #   Request:
    #   PATCH http://your.awesome/api/books/1
    #   {
    #     "name": "The Green Mile",
    #   }
    #
    #   Response:
    #   200 OK
    #   {
    #     "book": {
    #       "id": 1,
    #       "name": "The Green Mile",
    #       "author": "Stephen King"
    #     }
    #   }
    # @note You can sustomize creating action:
    #   - override {Params#permitted_fields_for_update permitted_fields_for_update} to set which params can be updated
    #   - override {Params#permitted_fields_for_show permitted_fields_for_show} to set which params will be shown in response
    #   - override {Render#render_subject render_subject} to set how subject will be rendered
    #   - override {Render#render_errors render_errors} to set how errors will be rendered
    #   - override {Render#render_not_found render_not_found} to set what to render when subject with ID from params is not found
    #   - override {Subject#subject_model subject_model} to set what model will be updated
    #   - override {Chains#update_chain update_chain} to add or remove methods which will be called while updating a subject
    #   - override {Render#decide_what_to_render decide_what_to_render} to set how it will be decided what to render in response
    # @use {#run_chain}
    # @use {Chains#update_chain}
    def update
      run_chain(update_chain)
    end

    # Destroys a subject by id
    # @example
    #   Request:
    #   DELETE http://your.awesome/api/books/1
    #
    #   Response:
    #   204 No Content
    # @note You can sustomize creating action:
    #   - override {Subject#destroy_subject destroy_subject} to set how it will be destroyed
    #   - override {Render#render_nothing render_nothing} to set what to render when subject is destroyed
    #   - override {Render#render_errors render_errors} to set how errors will be rendered
    #   - override {Render#render_not_found render_not_found} to set what to render when subject with ID from params is not found
    #   - override {Subject#subject_model subject_model} to set what model will be deleted
    #   - override {Chains#destroy_chain destroy_chain} to add or remove methods which will be called while deleting a subject
    # @use {#run_chain}
    # @use {Chains#destroy_chain}
    def destroy
      run_chain(destroy_chain)
    end

    # Shows a subject by id
    # @example
    #   Request:
    #   GET http://your.awesome/api/books/1
    #
    #   Response:
    #   200 OK
    #   {
    #     "book": {
    #       "id": 1,
    #       "name": "The Green Mile",
    #       "author": "Stephen King"
    #     }
    #   }
    # @note You can sustomize creating action:
    #   - override {Params#permitted_fields_for_show permitted_fields_for_show} to set which params will be shown in response
    #   - override {Render#render_subject render_subject} to set how subject will be rendered
    #   - override {Render#render_not_found render_not_found} to set what to render when subject with ID from params is not found
    #   - override {Subject#subject_model subject_model} to set what model will be shown
    #   - override {Chains#show_chain show_chain} to add or remove methods which will be called while updating a subject
    # @use {#run_chain}
    # @use {Chains#show_chain}
    def show
      run_chain(show_chain)
    end

    # Shows a list of subjects.
    # You can filter subjects by attributes using *filter* param.
    # You can sort subjects using *sort* param. It is a string of comma-separated attributes with minus before attributes you wants to sort descending.
    # You can paginate subjcts with *page* and *per_page* params.
    # @example
    #   Request:
    #   GET http://your.awesome/api/books
    #   GET http://your.awesome/api/books?filter[author]="King"
    #   GET http://your.awesome/api/books?filter[author][]="King"&filter[author][]="Kesey"
    #   GET http://your.awesome/api/books?sort=-id,name,-author
    #   GET http://your.awesome/api/books?page=3&per_page=10
    #   GET http://your.awesome/api/books?filter[author]="King"&sort=-id?page=3&per_page=10
    #
    #   Response:
    #   200 OK
    #   {
    #     "books": [{
    #       "id": 2,
    #       "name": "The Green Mile",
    #       "author": "Stephen King"
    #     }, {
    #       "id": 1,
    #       "name": "11/22/63",
    #       "author": "Stephen King"
    #     }]
    #   }
    # @note You can sustomize creating action:
    #   - override {Params#permitted_fields_for_show permitted_fields_for_show} to set which params will be shown in response
    #   - override {Params#permitted_fields_for_filter permitted_fields_for_filter} to set which params can be used for filtering
    #   - override {Params#permitted_fields_for_sort permitted_fields_for_sort} to set which params can be used for sorting
    #   - override {Params#default_sort_params default_sort_params} to set default sort params
    #   - override {Params#per_page_default per_page_default} to set default per_page param
    #   - override {Params#per_page_range per_page_range} to set minimum and maximum possible per_page value
    #   - override {Render#render_subjects render_subjects} to set how subjects will be rendered
    #   - override {Subject#subject_model subject_model} to set what model will be shown
    #   - override {Chains#index_chain index_chain} to add or remove methods which will be called while updating a subject
    # @use {#run_chain}
    # @use {Chains#index_chain}
    def index
      run_chain(index_chain)
    end

    protected

    # Executes each method in a chain one by one
    # @param chain [Array] array of methods to execute
    # @used_in {#create}
    # @used_in {#update}
    # @used_in {#destroy}
    # @used_in {#show}
    # @used_in {#index}
    def run_chain(chain)
      chain.each do |action|
        self.send(action)
      end
    end
  end
end