---
type: '0.1.1'
category: Base
title: included
description: Includes all methods in controller
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/base.rb#L15
order: 1
---

## Description
Includes all methods in controller

## Params
- [ActionController::Base] **base** - controller

## Source code
```ruby
# lib/resting_pug/base.rb

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
```



