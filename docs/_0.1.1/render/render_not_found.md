---
type: '0.1.1'
category: Render
title: render_not_found
description: Renders error when required object is not found
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/render.rb#L142
order: 7
---

## Description
Renders error when required object is not found

## Tip
Override this method to add more complicated logic of rendering.

## Used in
- [Base.included]({{ site.baseurl }}/0.1.1/base/included)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a render_not_found to render with message 'Not found'
  def render_not_found
    render json: { message: 'Not found' }, status: 404
  end
end
```

## Source code
```ruby
# lib/resting_pug/render.rb

def render_not_found
  render json: {}, status: 404
end
```



