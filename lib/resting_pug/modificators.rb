module RestingPug
  # Describes methods which modificate subject/subjects
  # @used_in {Base.included}
  module Modificators
    protected

    # Selects certain page from all subjects using pagination params
    # @note Override this method to change pagination of subjects
    # @used_in {Chains#index_chain}
    # @use {Params#pagination_params}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a paginate_subjects method to use kaminari instead of will_paginate
    #     def paginate_subjects
    #       @subjects = @subjects.page(pagination_params[:page]).per(pagination_params[:per_page])
    #     end
    #   end
    def paginate_subjects
      @subjects = @subjects.paginate(page: pagination_params[:page], per_page: pagination_params[:per_page])
    end

    # Sorts subjects using sorting params
    # @note Override this method to change sorting of subjects
    # @used_in {Chains#index_chain}
    # @use {Params#sort_params}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a sort_subjects method to remove default ordering beforehand.
    #     def sort_subjects
    #       @subjects = @subjects.reorder(nil).order(sort_params)
    #     end
    #   end
    def sort_subjects
      @subjects = @subjects.order(sort_params)
    end

    # Filters subjects using filter params
    # @note Override this method to change how subjects are filtered
    # @used_in {Chains#index_chain}
    # @use {Params#filter_params}
    # @example
    #   class BooksController < ApplicationController
    #     include RestingPug::Base
    #
    #     private
    #     # Override a filter_subjects method to remove default scope beforehand.
    #     def filter_subjects
    #       @subjects = @subjects.unscoped.where(filter_params)
    #     end
    #   end
    def filter_subjects
      @subjects = @subjects.where(filter_params)
    end
  end
end