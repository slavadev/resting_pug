---
type: '0.1.1'
category: Render
title: render_nothing
description: Renders empty response
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/render.rb#L91
order: 4
---

## Description
Renders empty response

## Tip
Override this method to add more complicated logic of rendering.

## Used in
- [Subject#destroy_subject]({{ site.baseurl }}/0.1.1/subject/destroy_subject)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a render_nothing to render with status 200
  def render_nothing
    render json: {}, status: 200
  end
end
```

## Source code
```ruby
# lib/resting_pug/render.rb

def render_nothing
  render json: {}, status: 204
end
```



