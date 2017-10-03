module SimpleRestAPI
  module Chains
    protected

    def create_chain
      [:create_subject, :decide_what_to_render]
    end

    def update_chain
      [:fetch_subject, :update_subject, :decide_what_to_render]
    end

    def destroy_chain
      [:fetch_subject, :destroy_subject]
    end

    def show_chain
      [:fetch_subject, :render_subject]
    end

    def index_chain
      [:fetch_subjects, :sort_subjects, :paginate_subjects, :render_subjects]
    end
  end
end