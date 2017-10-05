module SimpleRestAPI
  module Modificators
    protected

    def paginate_subjects
      @subjects = @subjects.paginate(page: pagination_params[:page], per_page: pagination_params[:per_page])
    end

    def sort_subjects
      @subjects = @subjects.order(sort_params)
    end

    def filter_subjects
      @subjects = @subjects.where(filter_params)
    end
  end
end