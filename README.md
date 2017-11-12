
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
- [Usage](#usage)
- [Created actions and thing that you can customize](#created-actions-and-things-you-can-customize)
  - [Create](#create)
  - [Update](#update)
  - [Destroy](#destroy)
  - [Show](#show)
  - [Index](#index)
- [Contributing](#contributing)
- [Changelog](#changelog)
- [License](#license)

## What is Resting Pug?
Resting Pug allows you to create a JSON API with just adding one line to your controller and fully customize it with overriding small and simple helper methods.

## Why should I use it?
Often when you want to try a new idea or create a simple app you want to implement basic features very fast.
Resting Pug allows you to do it with just couple lines of code.
But even though it is small and simple(and because it is small and simple) you can vastly customize created API.
Attributes user can see, attributes user can edit, number of items on page, how to render items and errors - thats just a small part of things you can change overriding basic Resting Pug methods.

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

**1. Create a model that will be accesible through API:**

```ruby
class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :author, presence: true, length: { minimum: 3 }
end
```

```ruby
class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.integer :rating

      t.timestamps
    end
  end
end
```

**2. Create a new controller and include ```RestingPug::Base``` into it to add CRUD actions:**

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

**3. Don't forget to add a route to ```config/routes.rb```**

```ruby
Rails.application.routes.draw do
  resources :books
end
```

**4. Enjoy your new API and don't hesitate to change it whatever you want!**

## List of actions and things that you can customize
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

- override [permitted_fields_for_create](https://korolvs.github.com/resting_pug/0.1.1/params/permitted_fields_for_create) to set which params can be set in a new subject
- override [permitted_fields_for_show](https://korolvs.github.com/resting_pug/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [render_subject](https://korolvs.github.com/resting_pug/0.1.1/render/render_subject) to set how subject will be rendered
- override [render_errors](https://korolvs.github.com/resting_pug/0.1.1/render/render_errors) to set how errors will be rendered
- override [subject_model](https://korolvs.github.com/resting_pug/0.1.1/subject/subject_model) to set what model will be created
- override [create_chain](https://korolvs.github.com/resting_pug/0.1.1/chains/create_chain) to add or remove methods which will be called while creating a subject
- override [decide_what_to_render](https://korolvs.github.com/resting_pug/0.1.1/render/decide_what_to_render) to set how it will be decided what to render in response

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

- override [permitted_fields_for_update](https://korolvs.github.com/resting_pug/0.1.1/params/permitted_fields_for_update) to set which params can be updated
- override [permitted_fields_for_show](https://korolvs.github.com/resting_pug/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [render_subject](https://korolvs.github.com/resting_pug/0.1.1/render/render_subject) to set how subject will be rendered
- override [render_errors](https://korolvs.github.com/resting_pug/0.1.1/render/render_errors) to set how errors will be rendered
- override [render_not_found](https://korolvs.github.com/resting_pug/0.1.1/render/render_not_found) to set what to render when subject with ID from params is not found
- override [subject_model](https://korolvs.github.com/resting_pug/0.1.1/subject/subject_model) to set what model will be updated
- override [update_chain](https://korolvs.github.com/resting_pug/0.1.1/chains/update_chain) to add or remove methods which will be called while updating a subject
- override [decide_what_to_render](https://korolvs.github.com/resting_pug/0.1.1/render/decide_what_to_render) to set how it will be decided what to render in response

### Destroy

```
Request:
DELETE http://your.awesome/api/books/1

Response:
204 No Content
```

Things you can customize:

- override [destroy_subject](https://korolvs.github.com/resting_pug/0.1.1/subject/destroy_subject) to set how it will be destroyed
- override [render_nothing](https://korolvs.github.com/resting_pug/0.1.1/render/render_nothing) to set what to render when subject is destroyed
- override [render_errors](https://korolvs.github.com/resting_pug/0.1.1/render/render_errors) to set how errors will be rendered
- override [render_not_found](https://korolvs.github.com/resting_pug/0.1.1/render/render_not_found) to set what to render when subject with ID from params is not found
- override [subject_model](https://korolvs.github.com/resting_pug/0.1.1/subject/subject_model) to set what model will be deleted
- override [destroy_chain](https://korolvs.github.com/resting_pug/0.1.1/chains/destroy_chain) to add or remove methods which will be called while deleting a subject

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

- override [permitted_fields_for_show](https://korolvs.github.com/resting_pug/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [render_subject](https://korolvs.github.com/resting_pug/0.1.1/render/render_subject) to set how subject will be rendered
- override [render_not_found](https://korolvs.github.com/resting_pug/0.1.1/render/render_not_found) to set what to render when subject with ID from params is not found
- override [subject_model](https://korolvs.github.com/resting_pug/0.1.1/subject/subject_model) to set what model will be shown
- override [show_chain](https://korolvs.github.com/resting_pug/0.1.1/chains/show_chain) to add or remove methods which will be called while updating a subject

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

- override [permitted_fields_for_show](https://korolvs.github.com/resting_pug/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [permitted_fields_for_filter](https://korolvs.github.com/resting_pug/0.1.1/params/permitted_fields_for_filter) to set which params can be used for filtering
- override [permitted_fields_for_sort](https://korolvs.github.com/resting_pug/0.1.1/params/permitted_fields_for_sort) to set which params can be used for sorting
- override [default_sort_params](https://korolvs.github.com/resting_pug/0.1.1/params/default_sort_params) to set default sort params
- override [per_page_default](https://korolvs.github.com/resting_pug/0.1.1/params/per_page_default) to set default per_page param
- override [per_page_range](https://korolvs.github.com/resting_pug/0.1.1/params/per_page_range) to set minimum and maximum possible per_page value
- override [render_subjects](https://korolvs.github.com/resting_pug/0.1.1/render/render_subjects) to set how subjects will be rendered
- override [subject_model](https://korolvs.github.com/resting_pug/0.1.1/subject/subject_model) to set what model will be shown
- override [index_chain](https://korolvs.github.com/resting_pug/0.1.1/chains/index_chain) to add or remove methods which will be called while updating a subject

## Contributing
You're encouraged to submit [pull requests](https://github.com/korolvs/resting_pug/pulls), [propose features and discuss issues](https://github.com/korolvs/resting_pug/issues).

See [CONTRIBUTING](CONTRIBUTING.md)

## Changelog
To see what has changed in recent versions of Resting Pug, see the [CHANGELOG](CHANGELOG.md).

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Logo is [Designed by Freepik](https://www.freepik.com/free-vector/happy-pug-resting-on-the-sofa_1357299.htm)
