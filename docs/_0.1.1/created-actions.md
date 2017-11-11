---
type: '0.1.1'
category: Getting Started
title: List of actions
order: 2
---

# Create

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

Things you can customize:

- override [permitted_fields_for_create]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_create) to set which params can be set in a new subject
- override [permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [render_subject]({{ site.baseurl }}/0.1.1/render/render_subject) to set how subject will be rendered
- override [render_errors]({{ site.baseurl }}/0.1.1/render/render_errors) to set how errors will be rendered
- override [subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model) to set what model will be created
- override [create_chain]({{ site.baseurl }}/0.1.1/chains/create_chain) to add or remove methods which will be called while creating a subject
- override [decide_what_to_render]({{ site.baseurl }}/0.1.1/render/decide_what_to_render) to set how it will be decided what to render in response

# Update

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

Things you can customize:

- override [permitted_fields_for_update]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_update) to set which params can be updated
- override [permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [render_subject]({{ site.baseurl }}/0.1.1/render/render_subject) to set how subject will be rendered
- override [render_errors]({{ site.baseurl }}/0.1.1/render/render_errors) to set how errors will be rendered
- override [render_not_found]({{ site.baseurl }}/0.1.1/render/render_not_found) to set what to render when subject with ID from params is not found
- override [subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model) to set what model will be updated
- override [update_chain]({{ site.baseurl }}/0.1.1/chains/update_chain) to add or remove methods which will be called while updating a subject
- override [decide_what_to_render]({{ site.baseurl }}/0.1.1/render/decide_what_to_render) to set how it will be decided what to render in response

# Destroy

```
Request:
DELETE http://your.awesome/api/books/1

Response:
204 No Content
```

Things you can customize:

- override [destroy_subject]({{ site.baseurl }}/0.1.1/subject/destroy_subject) to set how it will be destroyed
- override [render_nothing]({{ site.baseurl }}/0.1.1/render/render_nothing) to set what to render when subject is destroyed
- override [render_errors]({{ site.baseurl }}/0.1.1/render/render_errors) to set how errors will be rendered
- override [render_not_found]({{ site.baseurl }}/0.1.1/render/render_not_found) to set what to render when subject with ID from params is not found
- override [subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model) to set what model will be deleted
- override [destroy_chain]({{ site.baseurl }}/0.1.1/chains/destroy_chain) to add or remove methods which will be called while deleting a subject

# Show

```
Request:
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

Things you can customize:

- override [permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [render_subject]({{ site.baseurl }}/0.1.1/render/render_subject) to set how subject will be rendered
- override [render_not_found]({{ site.baseurl }}/0.1.1/render/render_not_found) to set what to render when subject with ID from params is not found
- override [subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model) to set what model will be shown
- override [show_chain]({{ site.baseurl }}/0.1.1/chains/show_chain) to add or remove methods which will be called while updating a subject

# Index

```
Request:
GET http://your.awesome/api/books
GET http://your.awesome/api/books?filter[author]="King"
GET http://your.awesome/api/books?filter[author][]="King"&filter[author][]="Kesey"
GET http://your.awesome/api/books?sort=-id,name,-author
GET http://your.awesome/api/books?page=3&per_page=10
GET http://your.awesome/api/books?filter[author]="King"&sort=-id?page=3&per_page=10

Response:
200 OK
{
  "books": [{
    "id": 2,
    "name": "The Green Mile",
    "author": "Stephen King"
  }, {
    "id": 1,
    "name": "11/22/63",
    "author": "Stephen King"
  }]
}
```

Things you can customize:

- override [permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [permitted_fields_for_filter]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter) to set which params can be used for filtering
- override [permitted_fields_for_sort]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_sort) to set which params can be used for sorting
- override [default_sort_params]({{ site.baseurl }}/0.1.1/params/default_sort_params) to set default sort params
- override [per_page_default]({{ site.baseurl }}/0.1.1/params/per_page_default) to set default per_page param
- override [per_page_range]({{ site.baseurl }}/0.1.1/params/per_page_range) to set minimum and maximum possible per_page value
- override [render_subjects]({{ site.baseurl }}/0.1.1/render/render_subjects) to set how subjects will be rendered
- override [subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model) to set what model will be shown
- override [index_chain]({{ site.baseurl }}/0.1.1/chains/index_chain) to add or remove methods which will be called while updating a subject
