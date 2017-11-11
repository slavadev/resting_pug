---
type: '0.1.1'
category: Actions
title: show
description: Shows a subject by id
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/actions.rb#L113
order: 4
---

## Description
Shows a subject by id

## Example
```
GET http://your.awesome/api/books/1

Response:
200 OK
{
  "book": {
    "id": 1,
    "name": "The Green Mile",
    "author": "Stephen King"
  }
}
```

## How to customize
- override [Params#permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [Render#render_subject]({{ site.baseurl }}/0.1.1/render/render_subject) to set how subject will be rendered
- override [Render#render_not_found]({{ site.baseurl }}/0.1.1/render/render_not_found) to set what to render when subject with ID from params is not found
- override [Subject#subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model) to set what model will be shown
- override [Chains#show_chain]({{ site.baseurl }}/0.1.1/chains/show_chain) to add or remove methods which will be called while updating a subject

## Use
- [#run_chain]({{ site.baseurl }}/0.1.1/actions/run_chain)
- [Chains#show_chain]({{ site.baseurl }}/0.1.1/chains/show_chain)

## Source code
```ruby
# lib/resting_pug/actions.rb

def show
  run_chain(show_chain)
end
```



