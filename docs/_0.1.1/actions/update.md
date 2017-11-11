---
type: '0.1.1'
category: Actions
title: update
description: Updates a subject by id with attributes from params and returns it
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/actions.rb#L67
order: 2
---

## Description
Updates a subject by id with attributes from params and returns it

## Example
```
Request:
PATCH http://your.awesome/api/books/1
{
  "name": "The Green Mile",
}

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
- override [Params#permitted_fields_for_update]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_update) to set which params can be updated
- override [Params#permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [Render#render_subject]({{ site.baseurl }}/0.1.1/render/render_subject) to set how subject will be rendered
- override [Render#render_errors]({{ site.baseurl }}/0.1.1/render/render_errors) to set how errors will be rendered
- override [Render#render_not_found]({{ site.baseurl }}/0.1.1/render/render_not_found) to set what to render when subject with ID from params is not found
- override [Subject#subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model) to set what model will be updated
- override [Chains#update_chain]({{ site.baseurl }}/0.1.1/chains/update_chain) to add or remove methods which will be called while updating a subject
- override [Render#decide_what_to_render]({{ site.baseurl }}/0.1.1/render/decide_what_to_render) to set how it will be decided what to render in response

## Use
- [#run_chain]({{ site.baseurl }}/0.1.1/actions/run_chain)
- [Chains#update_chain]({{ site.baseurl }}/0.1.1/chains/update_chain)

## Source code
```ruby
# lib/resting_pug/actions.rb

def update
  run_chain(update_chain)
end
```



