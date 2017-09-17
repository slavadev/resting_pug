module SimpleRestAPI
  module Subject
    protected

    def subject_model
      controller_name.classify.constantize
    end

    def subject_model_sym
      subject_model.to_s.underscore.to_sym
    end

    def subject_model_sym_plural
      subject_model.to_s.pluralize.underscore.to_sym
    end

    def create_subject
      @subject = subject_model.create(params_for_create)
    end

    def update_subject
      @subject.update(params_for_update)
    end

    def destroy_subject
      if @subject.destroy
        render_nothing
      else
        render_errors
      end
    end

    def fetch_subject
      @subject = subject_model.find(params[:id])
    end

    def fetch_subjects
      @subjects = subject_model.all
    end
  end
end