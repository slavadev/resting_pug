module SimpleRestAPI
  module Actions
    def create
      run_chain(create_chain)
    end

    def update
      run_chain(update_chain)
    end

    def destroy
      run_chain(destroy_chain)
    end

    def show
      run_chain(show_chain)
    end

    def index
      run_chain(index_chain)
    end

    protected

    def run_chain(chain)
      chain.each do |action|
        self.send(action)
      end
    end
  end
end