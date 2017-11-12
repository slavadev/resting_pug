---
type: '0.1.1'
category: Subject
title: subject_model
description: Gets a subject model from a controller class name
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/subject.rb#L25
order: 1
---

## Description
Gets a subject model from a controller class name

## Tip
Override this method if you want to use another model.

## Used in
- [#subject_model_sym]({{ site.baseurl }}/0.1.1/subject/subject_model_sym)
- [#subject_model_sym_plural]({{ site.baseurl }}/0.1.1/subject/subject_model_sym_plural)
- [#create_subject]({{ site.baseurl }}/0.1.1/subject/create_subject)
- [#fetch_subject]({{ site.baseurl }}/0.1.1/subject/fetch_subject)
- [#fetch_subjects]({{ site.baseurl }}/0.1.1/subject/fetch_subjects)
- [Params#permitted_fields]({{ site.baseurl }}/0.1.1/params/permitted_fields)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a subject_model to use Novel as a model
  def subject_model
    Novel
  end
end
```

## Source code
```ruby
# lib/resting_pug/subject.rb

def subject_model
  controller_name.classify.constantize
end
```



