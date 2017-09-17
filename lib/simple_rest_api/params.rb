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
  end
end