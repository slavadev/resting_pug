---
type: '0.1.1'
category: Subject
title: fetch_subject
description: Finds a subject by id
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/subject.rb#L149
order: 7
---

## Description
Finds a subject by id

## Tip
Override this method to add some custom logic to fetching process.

## Used in
- [Chains#create_chain]({{ site.baseurl }}/0.1.1/chains/create_chain)
- [Chains#update_chain]({{ site.baseurl }}/0.1.1/chains/update_chain)
- [Chains#destroy_chain]({{ site.baseurl }}/0.1.1/chains/destroy_chain)
- [Chains#show_chain]({{ site.baseurl }}/0.1.1/chains/show_chain)

## Use
- [#subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a fetch_subject to return a default subject if requested is not found
  def fetch_subject
    @subject = subject_model.find_by_id(params[:id]) || default_subject
  end
end
```

## Source code
```ruby
# lib/resting_pug/subject.rb

def fetch_subject
  @subject = subject_model.find(params[:id])
end
```



