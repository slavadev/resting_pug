---
type: '0.1.1'
category: Params
title: permitted_fields
description: Returns an array with all fields that API can use
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L28
order: 1
---

## Description
Returns an array with all fields that API can use

## Tip
Override this method to add or remove fields that you don't want API to use.

## Used in
- [#permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show)
- [#permitted_fields_for_create]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_create)
- [#permitted_fields_for_update]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_update)
- [#permitted_fields_for_sort]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_sort)
- [#permitted_fields_for_filter]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter)

## Use
- [Subject#subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a permitted_fields method to use only :id and :title
  def permitted_fields
    [:id, :title]
  end
end
```

## Source code
```ruby
# lib/resting_pug/params.rb

def permitted_fields
  subject_model.column_names.map(&:to_sym)
end
```



