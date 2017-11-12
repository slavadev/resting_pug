---
type: '0.1.1'
category: Params
title: permitted_fields_for_filter
description: Returns an array with all fields that API will allow to use while filtering subjects by single value
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L126
order: 6
---

## Description
Returns an array with all fields that API will allow to use while filtering subjects by single value

## Tip
Override this method to add or remove fields that you don't want API to use for filtering by single value

## Used in
- [#permitted_fields_for_filter_arrays]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter_arrays)
- [#permitted_fields_for_filter_with_arrays]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter_with_arrays)

## Use
- [#permitted_fields]({{ site.baseurl }}/0.1.1/params/permitted_fields)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a permitted_fields_for_sort method to use every permitted attribute except :title
  def permitted_fields_for_sort
    permitted_fields - [:title]
  end
end
```

## Source code
```ruby
# lib/resting_pug/params.rb

def permitted_fields_for_filter
  permitted_fields - [:created_at, :updated_at]
end
```



