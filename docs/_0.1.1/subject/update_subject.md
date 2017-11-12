---
type: '0.1.1'
category: Subject
title: update_subject
description: Updates a subject
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/subject.rb#L101
order: 5
---

## Description
Updates a subject

## Tip
Override this method to add some custom logic to updating process.

## Used in
- [Chains#update_chain]({{ site.baseurl }}/0.1.1/chains/update_chain)

## Use
- [Params#params_for_update]({{ site.baseurl }}/0.1.1/params/params_for_update)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a update_subject to update only if title is not 'None'
  def update_subject
    @subject.update(params_for_update) unless params_for_update[:title] == 'None'
  end
end
```

## Source code
```ruby
# lib/resting_pug/subject.rb

def update_subject
  @subject.update(params_for_update)
end
```



