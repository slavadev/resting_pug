---
type: '0.1.1'
category: Params
title: permitted_fields_for_sort
description: Returns an array with all fields that API will allow to use while sorting subjects
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L105
order: 5
---

## Description
Returns an array with all fields that API will allow to use while sorting subjects

## Tip
Override this method to add or remove fields that you don't want API to use for sorting.

## Used in
- [#sort_params]({{ site.baseurl }}/0.1.1/params/sort_params)

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

def permitted_fields_for_sort
  permitted_fields
end
```



