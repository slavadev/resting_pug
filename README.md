
<h1 align="center">
  <br>
  <a href="https://korolvs.github.com/resting_pug"><img src="https://korolvs.github.com/resting_pug/logo.svg" alt="Logo" width="80%"></a>
  <br>
</h1>

[![Gem Version](https://badge.fury.io/rb/resting_pug.svg)](https://badge.fury.io/rb/resting_pug)
## Table of Contents

- [What is Resting Pug?](#what-is-resting-pug)
- [Why should I use it?](#why-should-i-use-it)
- [Installation](#installation)
- [Usage](#usage )
  - [Create](#create)
  - [Update](#update)
  - [Destroy](#destroy)
  - [Show](#show)
  - [Index](#index)
- [Contributing](#contributing)
- [License](#license)

## What is Resting Pug?
Resting Pug allows you to create a JSON API with just adding one line to your controller and fully customize it with overriding small and simple helper methods.

## Why should I use it?

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'resting_pug'
```

And then execute:
```bash
$ bundle
```

## Usage
Include ```RestingPug::Base``` into controller to add CRUD actions to it:

```ruby
class BooksController < ApplicationController
  include RestingPug::Base
end
```

You can add CRUD actions to all controllers by including this module into ```ApplicationController```:

```ruby
class ApplicationController < ActionController::Base
  include RestingPug::Base
end
```

Don't forget to add a route to ```config/routes.rb``` 

```ruby
Rails.application.routes.draw do
  resources :books
end
```

Actions created after including ```RestingPug::Base```:

### Create

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

- override [Params#permitted_fields_for_create](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Params#permitted_fields_for_create-instance_method) to set which params can be set in a new subject
- override [Params#permitted_fields_for_show](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Params#permitted_fields_for_show-instance_method) to set which params will be shown in response
- override [Render#render_subject](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#render_subject-instance_method) to set how subject will be rendered
- override [Render#render_errors](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#render_errors-instance_method) to set how errors will be rendered
- override [Subject#subject_model](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Subject#subject_model-instance_method) to set what model will be created
- override [Chains#create_chain](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Chains#create_chain-instance_method) to add or remove methods which will be called while creating a subject
- override [Render#decide_what_to_render](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#decide_what_to_render-instance_method) to set how it will be decided what to render in response

### Update

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

- override [Params#permitted_fields_for_update](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Params#permitted_fields_for_update-instance_method) to set which params can be updated
- override [Params#permitted_fields_for_show](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Params#permitted_fields_for_show-instance_method) to set which params will be shown in response
- override [Render#render_subject](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#render_subject-instance_method) to set how subject will be rendered
- override [Render#render_errors](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#render_errors-instance_method) to set how errors will be rendered
- override [Render#render_not_found](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#render_not_found-instance_method) to set what to render when subject with ID from params is not found
- override [Subject#subject_model](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Subject#subject_model-instance_method) to set what model will be updated
- override [Chains#update_chain](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Chains#update_chain-instance_method) to add or remove methods which will be called while updating a subject
- override [Render#decide_what_to_render](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#decide_what_to_render-instance_method) to set how it will be decided what to render in response

### Destroy

```
Request:
DELETE http://your.awesome/api/books/1

Response:
204 No Content
```

Things you can customize:

- override [Subject#destroy_subject](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Subject#destroy_subject-instance_method) to set how it will be destroyed
- override [Render#render_nothing](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#render_nothing-instance_method) to set what to render when subject is destroyed
- override [Render#render_errors](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#render_errors-instance_method) to set how errors will be rendered
- override [Render#render_not_found](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#render_not_found-instance_method) to set what to render when subject with ID from params is not found
- override [Subject#subject_model](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Subject#subject_model-instance_method) to set what model will be deleted
- override [Chains#destroy_chain](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Chains#destroy_chain-instance_method) to add or remove methods which will be called while deleting a subject

### Show

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

- override [Params#permitted_fields_for_show](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Params#permitted_fields_for_show-instance_method) to set which params will be shown in response
- override [Render#render_subject](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#render_subject-instance_method) to set how subject will be rendered
- override [Render#render_not_found](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#render_not_found-instance_method) to set what to render when subject with ID from params is not found
- override [Subject#subject_model](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Subject#subject_model-instance_method) to set what model will be shown
- override [Chains#show_chain](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Chains#show_chain-instance_method) to add or remove methods which will be called while updating a subject

### Index

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

- override [Params#permitted_fields_for_show](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Params#permitted_fields_for_show-instance_method) to set which params will be shown in response
- override [Params#permitted_fields_for_filter](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Params#permitted_fields_for_filter-instance_method) to set which params can be used for filtering
- override [Params#permitted_fields_for_sort](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Params#permitted_fields_for_sort-instance_method) to set which params can be used for sorting
- override [Params#default_sort_params](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Params#default_sort_params-instance_method) to set default sort params
- override [Params#per_page_default](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Params#per_page_default-instance_method) to set default per_page param
- override [Params#per_page_range](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Params#per_page_range-instance_method) to set minimum and maximum possible per_page value
- override [Render#render_subjects](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Render#render_subjects-instance_method) to set how subjects will be rendered
- override [Subject#subject_model](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Subject#subject_model-instance_method) to set what model will be shown
- override [Chains#index_chain](http://www.rubydoc.info/github/korolvs/resting_pug/RestingPug/Chains#index_chain-instance_method) to add or remove methods which will be called while updating a subject

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Logo is [Designed by Freepik](https://www.freepik.com/free-vector/happy-pug-resting-on-the-sofa_1357299.htm)
