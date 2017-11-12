---
type: '0.1.1'
category: Render
title: render_param_missing
description: Renders error when required params are missing
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/render.rb#L125
order: 6
---

## Description
Renders error when required params are missing

## Tip
Override this method to add more complicated logic of rendering.

## Used in
- [Base.included]({{ site.baseurl }}/0.1.1/base/included)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a render_param_missing to render with status 422
  def render_param_missing
    render json: { errors: { subject_model_sym => ['param is missing'] } }, status: 422
  end
end
```

## Source code
```ruby
# lib/resting_pug/render.rb

def render_param_missing
  render json: { errors: { subject_model_sym => ['param is missing'] } }, status: 400
end
```



