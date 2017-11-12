---
type: '0.1.1'
category: Subject
title: create_subject
description: Creates a subject
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/subject.rb#L83
order: 4
---

## Description
Creates a subject

## Tip
Override this method to add some custom logic to creating process.

## Used in
- [Chains#create_chain]({{ site.baseurl }}/0.1.1/chains/create_chain)

## Use
- [#subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model)
- [Params#params_for_create]({{ site.baseurl }}/0.1.1/params/params_for_create)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a create_subject to create only if title is not 'None'
  def create_subject
    @subject = subject_model.create(params_for_create) unless params_for_create[:title] == 'None'
  end
end
```

## Source code
```ruby
# lib/resting_pug/subject.rb

def create_subject
  @subject = subject_model.create(params_for_create)
end
```



