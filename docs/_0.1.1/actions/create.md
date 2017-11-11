---
type: '0.1.1'
category: Actions
title: create
description: Creates a subject with attributes from params and returns it
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/actions.rb#L35
order: 1
---

## Description
Creates a subject with attributes from params and returns it

## Example
```
Request:
POST http://your.awesome/api/books
{
  "name": "11/22/63",
  "author": "Stephen King"
}

Response:
200 OK
{
  "book": {
    "id": 1,
    "name": "11/22/63",
    "author": "Stephen King"
  }
}
```

## How to customize
- override [Params#permitted_fields_for_create]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_create) to set which params can be set in a new subject
- override [Params#permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [Render#render_subject]({{ site.baseurl }}/0.1.1/render/render_subject) to set how subject will be rendered
- override [Render#render_errors]({{ site.baseurl }}/0.1.1/render/render_errors) to set how errors will be rendered
- override [Subject#subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model) to set what model will be created
- override [Chains#create_chain]({{ site.baseurl }}/0.1.1/chains/create_chain) to add or remove methods which will be called while creating a subject
- override [Render#decide_what_to_render]({{ site.baseurl }}/0.1.1/render/decide_what_to_render) to set how it will be decided what to render in response

## Use
- [#run_chain]({{ site.baseurl }}/0.1.1/actions/run_chain)
- [Chains#create_chain]({{ site.baseurl }}/0.1.1/chains/create_chain)

## Source code
```ruby
# lib/resting_pug/actions.rb

def create
  run_chain(create_chain)
end
```



