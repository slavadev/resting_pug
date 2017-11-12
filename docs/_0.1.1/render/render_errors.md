---
type: '0.1.1'
category: Render
title: render_errors
description: Renders errors
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/render.rb#L108
order: 5
---

## Description
Renders errors

## Tip
Override this method to add more complicated logic of rendering.

## Used in
- [#decide_what_to_render]({{ site.baseurl }}/0.1.1/render/decide_what_to_render)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a render_errors to render with status 400
  def render_errors
    render json: { errors: @subject.errors }, status: 400
  end
end
```

## Source code
```ruby
# lib/resting_pug/render.rb

def render_errors
  render json: { errors: @subject.errors }, status: 422
end
```



