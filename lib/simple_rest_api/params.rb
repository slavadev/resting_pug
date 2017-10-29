module SimpleRestAPI
  # Describes transformations with params
  # @used_in {Base.included}
  module Params
    protected

    ### PERMITTED FIELDS

    # Returns an array with all fields that API can use
    # @note Override this method to add or remove fields that you don't want API to use.
    # @return [Array] of symbols representing attributes
    # @used_in {#permitted_fields_for_show}
    # @used_in {#permitted_fields_for_create}
    # @used_in {#permitted_fields_for_update}
    # @used_in {#permitted_fields_for_sort}
    # @used_in {#permitted_fields_for_filter}
    # @use {Subject#subject_model}
    def permitted_fields
      subject_model.column_names.map(&:to_sym)
    end

    # Returns an array with all fields that API will show
    # @note Override this method to add or remove fields that you don't want API to show.
    # @return [Array] of symbols representing attributes
    # @used_in {Render#render_subject}
    # @used_in {Render#render_subjects}
    # @use {#permitted_fields}
    def permitted_fields_for_show
      permitted_fields
    end

    # Returns an array with all fields that API will allow to use while creating a subject
    # @note Override this method to add or remove fields that you don't want API to use for creating.
    # @return [Array] of symbols representing attributes
    # @used_in {#params_for_create}
    # @use {#permitted_fields}
    def permitted_fields_for_create
      permitted_fields - [:id, :created_at, :updated_at]
    end

    # Returns an array with all fields that API will allow to use while updating a subject
    # @note Override this method to add or remove fields that you don't want API to use for updating.
    # @return [Array] of symbols representing attributes
    # @used_in {#params_for_update}
    # @use {#permitted_fields}
    def permitted_fields_for_update
      permitted_fields - [:id, :created_at, :updated_at]
    end

    # Returns an array with all fields that API will allow to use while sorting subjects
    # @note Override this method to add or remove fields that you don't want API to use for sorting.
    # @return [Array] of symbols representing attributes
    # @used_in {#sort_params}
    # @use {#permitted_fields}
    def permitted_fields_for_sort
      permitted_fields
    end

    # Returns an array with all fields that API will allow to use while filtering subjects by single value
    # @note Override this method to add or remove fields that you don't want API to use for filtering by single value.
    #   If you want to change attributes that can be filtered by arrays of values check {#permitted_fields_for_filter_arrays}
    # @return [Array] of symbols representing attributes
    # @used_in {#permitted_fields_for_filter_arrays}
    # @used_in {#permitted_fields_for_filter_with_arrays}
    # @use {#permitted_fields}
    def permitted_fields_for_filter
      permitted_fields - [:created_at, :updated_at]
    end

    # Returns an array with all fields that API will allow to use while filtering subjects by array of values
    # @note Override this method to add or remove fields that you don't want API to use for filtering by array of values.
    #   If you want to change attributes that can be filtered by single value check {#permitted_fields_for_filter}
    # @return [Array] of symbols representing attributes
    # @used_in {#permitted_fields_for_filter_with_arrays}
    # @use {#permitted_fields_for_filter}
    def permitted_fields_for_filter_arrays
      permitted_fields_for_filter.map { |field| { field => [] } }
    end

    # Returns an array with all fields that API will allow to use while filtering subjects both by single values and by array of values
    # @note To set fields that can be used check {#permitted_fields_for_filter} and {#permitted_fields_for_filter_arrays}
    # @return [Array] of symbols representing attributes
    # @used_in {#filter_params}
    # @use {#permitted_fields_for_filter}
    # @use {#permitted_fields_for_filter_arrays}
    def permitted_fields_for_filter_with_arrays
      permitted_fields_for_filter + permitted_fields_for_filter_arrays
    end

    # PARAMS

    # Returns strong parameters which are used in creating action
    # @note Override {#permitted_fields_for_create} to set allowed fields.
    #   Override {Subject#subject_model_sym} to change the root attrubute of params.
    # @see http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    # @used_in {Subject#create_subject}
    # @use {Subject#subject_model_sym}
    # @use {#permitted_fields_for_create}
    def params_for_create
      params.require(subject_model_sym).permit(permitted_fields_for_create)
    end

    # Returns strong parameters which are used in updating action
    # @note Override {#permitted_fields_for_update} to set allowed fields.
    #   Override {Subject#subject_model_sym} to change the root attrubute of params.
    # @see http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    # @used_in {Subject#update_subject}
    # @use {Subject#subject_model_sym}
    # @use {#permitted_fields_for_update}
    def params_for_update
      params.require(subject_model_sym).permit(permitted_fields_for_update)
    end

    # FILTERING

    # Returns strong parameters which are used for filtering subjects
    # @note Override {#permitted_fields_for_filter} and {permitted_fields_for_filter_arrays} to set allowed fields.
    # @see http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    # @used_in {Modificators#filter_subjects}
    # @use {#permitted_fields_for_filter_with_arrays}
    def filter_params
      params[:filter] ? params.require(:filter).permit(permitted_fields_for_filter_with_arrays) : nil
    end

    # SORT

    # Transforms a string like "-id,name" to a hash { id: :desc, name: :asc }
    # @note Override {#permitted_fields_for_sort} to set allowed fields to sort.
    #   Override {#default_sort_params} to set default sort params.
    # @used_in {Modificators#sort_subjects}
    # @use {#permitted_fields_for_sort}
    # @use {#default_sort_params}
    def sort_params
      sort_hash = nil
      if params[:sort]
        sort_array = params[:sort].split(',')
        sort_array = sort_array.map do |field|
          is_desc = field.split('-').count > 1
          name = field.split('-').last
          { name: name.to_sym, is_desc: is_desc }
        end
        sort_array.select! do |field|
          permitted_fields_for_sort.include? field[:name]
        end
        sort_array.each do |field|
          sort_hash ||= {}
          sort_hash[field[:name]] = field[:is_desc] ? :desc : :asc
        end
      end
      sort_hash || default_sort_params
    end

    # Returns a hash with default sorting params
    # @note Override {#permitted_fields_for_sort} to set allowed fields to sort.
    # @see http://guides.rubyonrails.org/active_record_querying.html#ordering
    # @used_in {#sort_params}
    def default_sort_params
      {id: :desc}
    end

    # PAGINATION

    # Handles pagination params and return a hash like { page: 1, per_page: 10 }
    # @note Override {#per_page_range} to set minimum and maximum per_page param.
    #   Override {#per_page_default} to set default per_page param.
    # @used_in {Modificators#paginate_subjects}
    # @use {#per_page_range}
    # @use {#per_page_default}
    def pagination_params
      page = params[:page].try(:to_i) || 1
      per_page = [per_page_range[:min], params[:per_page].try(:to_i) || per_page_default, per_page_range[:max]].sort[1]
      return { page: page, per_page: per_page }
    end

    # Returns a hash minimum and maximum per_page param like { page: 1, per_page: 10 }
    # @note Override {#per_page_default} to set default per_page param.
    # @used_in {#pagination_params}
    def per_page_range
      { min: 5, max: 100 }
    end

    # Returns a default per_page param
    # @note Override {#per_page_range} to set minimum and maximum per_page param
    # @used_in {#pagination_params}
    def per_page_default
      10
    end
  end
end