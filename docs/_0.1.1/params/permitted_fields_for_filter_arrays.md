---
type: '0.1.1'
category: Params
title: permitted_fields_for_filter_arrays
description: Returns an array with all fields that API will allow to use while filtering subjects by array of values
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L146
order: 7
---

## Description
Returns an array with all fields that API will allow to use while filtering subjects by array of values

## Tip
Override this method to add or remove fields that you don't want API to use for filtering by array of values.<br/>
If you want to change attributes that can be filtered by single value check [#permitted_fields_for_filter]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter)

## Used in
- [#permitted_fields_for_filter_with_arrays]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter_with_arrays)

## Use
- [#permitted_fields_for_filter]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a permitted_fields_for_filter_arrays method to use only :id and :title
  def permitted_fields_for_filter_arrays
    { id: [], title: []}
  end
end
```

## Source code
```ruby
# lib/resting_pug/params.rb

def permitted_fields_for_filter_arrays
  permitted_fields_for_filter.map { |field| { field => [] } }
end
```



