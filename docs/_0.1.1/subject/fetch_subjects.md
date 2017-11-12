---
type: '0.1.1'
category: Subject
title: fetch_subjects
description: Returns all subjects accessable for API
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/subject.rb#L167
order: 8
---

## Description
Returns all subjects accessable for API

## Tip
Override this method to add some custom logic to fetching process.

## Used in
- [Chains#index_chain]({{ site.baseurl }}/0.1.1/chains/index_chain)

## Use
- [#subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a fetch_subjects to return subject where title is not 'None'
  def fetch_subjects
    @subjects = subject_model.where.not(title: 'None')
  end
end
```

## Source code
```ruby
# lib/resting_pug/subject.rb

def fetch_subjects
  @subjects = subject_model.all
end
```



