---
type: '0.1.1'
category: Params
title: permitted_fields_for_update
description: Returns an array with all fields that API will allow to use while updating a subject
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L86
order: 4
---

## Description
Returns an array with all fields that API will allow to use while updating a subject

## Tip
Override this method to add or remove fields that you don't want API to use for updating.

## Used in
- [#params_for_update]({{ site.baseurl }}/0.1.1/params/params_for_update)

## Use
- [#permitted_fields]({{ site.baseurl }}/0.1.1/params/permitted_fields)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a permitted_fields_for_update method to use every permitted attribute except :title
  def permitted_fields_for_update
    permitted_fields - [:title]
  end
end
```

## Source code
```ruby
# lib/resting_pug/params.rb

def permitted_fields_for_update
  permitted_fields - [:id, :created_at, :updated_at]
end
```



