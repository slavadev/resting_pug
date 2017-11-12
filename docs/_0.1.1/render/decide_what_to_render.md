---
type: '0.1.1'
category: Render
title: decide_what_to_render
description: Calls #render_subject if subject is valid and #render_errors otherwise
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/render.rb#L27
order: 1
---

## Description
Calls [#render_subject]({{ site.baseurl }}/0.1.1/render/render_subject) if subject is valid and [#render_errors]({{ site.baseurl }}/0.1.1/render/render_errors) otherwise

## Tip
Override [#render_subject]({{ site.baseurl }}/0.1.1/render/render_subject) and [#render_errors]({{ site.baseurl }}/0.1.1/render/render_errors) to change rendering behaviour

## Used in
- [Chains#create_chain]({{ site.baseurl }}/0.1.1/chains/create_chain)
- [Chains#update_chain]({{ site.baseurl }}/0.1.1/chains/update_chain)

## Use
- [#render_subject]({{ site.baseurl }}/0.1.1/render/render_subject)
- [#render_errors]({{ site.baseurl }}/0.1.1/render/render_errors)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a decide_what_to_render to render something special if @subject id is 3
  def decide_what_to_render
    if @subject.valid?
      @subject.id == 3 ? render_something_special : render_subject
    else
      render_errors
    end
  end
end
```

## Source code
```ruby
# lib/resting_pug/render.rb

def decide_what_to_render
  if @subject.valid?
    render_subject
  else
    render_errors
  end
end
```



