require_relative './actions'
require_relative './chains'
require_relative './render'
require_relative './subject'
require_relative './params'
require_relative './modificators'
require 'will_paginate/active_record'

module SimpleRestAPI
  # Main module
  module Base
    # Includes all methods in controller
    # @param base [ActionController::Base]
    def self.included(base)
      base.class_eval do
        include SimpleRestAPI::Actions
        include SimpleRestAPI::Chains
        include SimpleRestAPI::Render
        include SimpleRestAPI::Subject
        include SimpleRestAPI::Params
        include SimpleRestAPI::Modificators

        rescue_from ActionController::ParameterMissing, with: :render_param_missing
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
      end
    end
  end
end