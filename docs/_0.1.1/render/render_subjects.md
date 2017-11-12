---
type: '0.1.1'
category: Render
title: render_subjects
description: Renders json with subjects
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/render.rb#L74
order: 3
---

## Description
Renders json with subjects

## Tip
Override this method to add more complicated logic of rendering.<br/>
Override [Subject#subject_model_sym_plural]({{ site.baseurl }}/0.1.1/subject/subject_model_sym_plural) to change root attribute.<br/>
Override [Params#permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show) to change shown attributes.

## Used in
- [Chains#index_chain]({{ site.baseurl }}/0.1.1/chains/index_chain)

## Use
- [Subject#subject_model_sym_plural]({{ site.baseurl }}/0.1.1/subject/subject_model_sym_plural)
- [Params#permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a render_subjects to render with 'items' as a root object
  def render_subjects
    render json: { items: @subjects.as_json(only: permitted_fields_for_show) }
  end
end
```

## Source code
```ruby
# lib/resting_pug/render.rb

def render_subjects
  render json: { subject_model_sym_plural => @subjects.as_json(only: permitted_fields_for_show) }
end
```



