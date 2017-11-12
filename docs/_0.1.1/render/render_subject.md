---
type: '0.1.1'
category: Render
title: render_subject
description: Renders json with a subject
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/render.rb#L53
order: 2
---

## Description
Renders json with a subject

## Tip
Override this method to add more complicated logic of rendering.<br/>
Override [Subject#subject_model_sym]({{ site.baseurl }}/0.1.1/subject/subject_model_sym) to change root attribute.<br/>
Override [Params#permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show) to change shown attributes.

## Used in
- [#decide_what_to_render]({{ site.baseurl }}/0.1.1/render/decide_what_to_render)
- [Chains#show_chain]({{ site.baseurl }}/0.1.1/chains/show_chain)

## Use
- [Subject#subject_model_sym]({{ site.baseurl }}/0.1.1/subject/subject_model_sym)
- [Params#permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a render_subject to render without a root object
  def render_subject
    render json: @subject.as_json(only: permitted_fields_for_show)
  end
end
```

## Source code
```ruby
# lib/resting_pug/render.rb

def render_subject
  render json: { subject_model_sym => @subject.as_json(only: permitted_fields_for_show) }
end
```



