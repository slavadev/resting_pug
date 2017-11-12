---
type: '0.1.1'
category: Subject
title: subject_model_sym
description: Returns a symbol out of the subject model name
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/subject.rb#L46
order: 2
---

## Description
Returns a symbol out of the subject model name

## Tip
Override this method to get another root for params and JSON responses.

## Used in
- [Params#params_for_create]({{ site.baseurl }}/0.1.1/params/params_for_create)
- [Params#params_for_update]({{ site.baseurl }}/0.1.1/params/params_for_update)
- [Render#render_subject]({{ site.baseurl }}/0.1.1/render/render_subject)
- [Render#render_param_missing]({{ site.baseurl }}/0.1.1/render/render_param_missing)

## Use
- [#subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a subject_model to use :novel as a symbol used in params and rendering
  def subject_model_sym
    :novel
  end
end
```

## Source code
```ruby
# lib/resting_pug/subject.rb

def subject_model_sym
  subject_model.to_s.underscore.to_sym
end
```



