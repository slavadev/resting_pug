---
type: '0.1.1'
category: Subject
title: subject_model_sym_plural
description: Returns a symbol out of the subject model name(plural)
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/subject.rb#L64
order: 3
---

## Description
Returns a symbol out of the subject model name(plural)

## Tip
Override this method to get another root for params and JSON responses.

## Used in
- [Render#render_subjects]({{ site.baseurl }}/0.1.1/render/render_subjects)

## Use
- [#subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a subject_model_sym_plural to use :novels as a symbol used in index action
  def subject_model_sym_plural
    :novels
  end
end
```

## Source code
```ruby
# lib/resting_pug/subject.rb

def subject_model_sym_plural
  subject_model.to_s.pluralize.underscore.to_sym
end
```



