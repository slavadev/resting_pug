---
type: '0.1.1'
category: Params
title: permitted_fields_for_create
description: Returns an array with all fields that API will allow to use while creating a subject
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L67
order: 3
---

## Description
Returns an array with all fields that API will allow to use while creating a subject

## Tip
Override this method to add or remove fields that you don't want API to use for creating.

## Used in
- [#params_for_create]({{ site.baseurl }}/0.1.1/params/params_for_create)

## Use
- [#permitted_fields]({{ site.baseurl }}/0.1.1/params/permitted_fields)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a permitted_fields_for_create method to use every permitted attribute except :title
  def permitted_fields_for_create
    permitted_fields - [:title]
  end
end
```

## Source code
```ruby
# lib/resting_pug/params.rb

def permitted_fields_for_create
  permitted_fields - [:id, :created_at, :updated_at]
end
```



