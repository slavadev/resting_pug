module SimpleRestAPI
  module Params
    protected

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

    def permitted_fields_for_sort
      permitted_fields
    end

    def permitted_fields_for_filter
      permitted_fields - [:created_at, :updated_at]
    end

    def permitted_fields_for_filter_arrays
      permitted_fields_for_filter.map { |field| { field => [] } }
    end

    def permitted_fields_for_filter_with_arrays
      permitted_fields_for_filter + permitted_fields_for_filter_arrays
    end

    # PARAMS
    def params_for_create
      params.require(subject_model_sym).permit(permitted_fields_for_create)
    end

    def params_for_update
      params.require(subject_model_sym).permit(permitted_fields_for_update)
    end

    # FILTERING
    def filter_params
      params[:filter] ? params.require(:filter).permit(permitted_fields_for_filter_with_arrays) : nil
    end

    # SORT
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

    def default_sort_params
      {id: :desc}
    end

    # PAGINATION
    def pagination_params
      page = params[:page].try(:to_i) || 1
      per_page = [per_page_range[:min], params[:per_page].try(:to_i) || per_page_default, per_page_range[:max]].sort[1]
      return { page: page, per_page: per_page }
    end

    def per_page_range
      { min: 5, max: 100 }
    end

    def per_page_default
      10
    end
  end
end