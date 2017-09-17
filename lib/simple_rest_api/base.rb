require_relative './chains'
require_relative './render'
require_relative './subject'
require_relative './params'
require_relative './modificators'
require 'will_paginate/active_record'

module SimpleRestAPI
  module Base
    def self.included(base)
      base.class_eval do
        include SimpleRestAPI::Chains
        include SimpleRestAPI::Render
        include SimpleRestAPI::Subject
        include SimpleRestAPI::Params
        include SimpleRestAPI::Modificators

        rescue_from ActionController::ParameterMissing, with: :render_param_missing
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

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
  end
end