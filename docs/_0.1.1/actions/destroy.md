---
type: '0.1.1'
category: Actions
title: destroy
description: Destroys a subject by id
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/actions.rb#L87
order: 3
---

## Description
Destroys a subject by id

## Example
```
Request:
DELETE http://your.awesome/api/books/1

Response:
204 No Content
```

## How to customize
- override [Subject#destroy_subject](/0.1.1/subject/destroy_subject) to set how it will be destroyed
- override [Render#render_nothing](/0.1.1/render/render_nothing) to set what to render when subject is destroyed
- override [Render#render_errors](/0.1.1/render/render_errors) to set how errors will be rendered
- override [Render#render_not_found](/0.1.1/render/render_not_found) to set what to render when subject with ID from params is not found
- override [Subject#subject_model](/0.1.1/subject/subject_model) to set what model will be deleted
- override [Chains#destroy_chain](/0.1.1/chains/destroy_chain) to add or remove methods which will be called while deleting a subject

## Use
- [#run_chain](/0.1.1/actions/run_chain)
- [Chains#destroy_chain](/0.1.1/chains/destroy_chain)

## Source code
```ruby
# lib/resting_pug/actions.rb

def destroy
  run_chain(destroy_chain)
end
```



