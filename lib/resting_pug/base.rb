require_relative './actions'
require_relative './chains'
require_relative './render'
require_relative './subject'
require_relative './params'
require_relative './modificators'
require 'will_paginate/active_record'

module RestingPug
  # Main module
  module Base
    # Includes all methods in controller
    # @param base [ActionController::Base]
    def self.included(base)
      base.class_eval do
        include RestingPug::Actions
        include RestingPug::Chains
        include RestingPug::Render
        include RestingPug::Subject
        include RestingPug::Params
        include RestingPug::Modificators

        rescue_from ActionController::ParameterMissing, with: :render_param_missing
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
      end
    end
  end
end