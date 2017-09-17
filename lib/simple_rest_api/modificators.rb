module SimpleRestAPI
  module Modificators
    protected

    def paginate_subjects
      @subjects = @subjects.paginate(page: pagination_params[:page], per_page: pagination_params[:per_page])
    end

    def order_subjects
      @subjects = @subjects.order(:id)
    end
  end
end