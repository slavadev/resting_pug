---
type: '0.1.1'
category: Subject
title: destroy_subject
description: Destroys a subject and render nothing or errors
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/subject.rb#L124
order: 6
---

## Description
Destroys a subject and render nothing or errors

## Tip
Override this method to add some custom logic to destroying process.

## Used in
- [Chains#destroy_chain]({{ site.baseurl }}/0.1.1/chains/destroy_chain)

## Use
- [Render#render_nothing]({{ site.baseurl }}/0.1.1/render/render_nothing)
- [Render#render_errors]({{ site.baseurl }}/0.1.1/render/render_errors)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a destroy_subject to destroy only if title is not 'None'
  def destroy_subject
    if @subject.title != 'None' && @subject.destroy
      render_nothing
    else
      render_errors
    end
  end
end
```

## Source code
```ruby
# lib/resting_pug/subject.rb

def destroy_subject
  if @subject.destroy
    render_nothing
  else
    render_errors
  end
end
```



