module SimpleRestAPI
  # Describes basic CRUD actions
  # @see https://en.wikipedia.org/wiki/Create,_read,_update_and_delete
  # @used_in {Base.included}
  module Actions
    # Creates a subject
    # @use {#run_chain}
    # @use {Chains#create_chain}
    def create
      run_chain(create_chain)
    end

    # Updates a subject by id
    # @use {#run_chain}
    # @use {Chains#update_chain}
    def update
      run_chain(update_chain)
    end

    # Destroys a subject by id
    # @use {#run_chain}
    # @use {Chains#destroy_chain}
    def destroy
      run_chain(destroy_chain)
    end

    # Shows a subject by id
    # @use {#run_chain}
    # @use {Chains#show_chain}
    def show
      run_chain(show_chain)
    end

    # Shows a list of subjects
    # @use {#run_chain}
    # @use {Chains#index_chain}
    def index
      run_chain(index_chain)
    end

    protected

    # Executes each method in a chain one by one
    # @param chain [Array] array of methods to execute
    def run_chain(chain)
      chain.each do |action|
        self.send(action)
      end
    end
  end
end