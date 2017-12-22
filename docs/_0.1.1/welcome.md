---
type: '0.1.1'
category: Getting Started
title: Welcome
order: 1
---

<h1 align="center">
  <br>
  <img src="{{ site.baseurl }}/logo.png" alt="Logo" width="100%">
  <br>
</h1>

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

**1.** Create a model that will be accesible through API:

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

**2.** Create a new controller and include **RestingPug::Base** into it to add CRUD actions:

```ruby
class BooksController < ApplicationController
  include RestingPug::Base
end
```

You can add CRUD actions to all controllers by including this module into **ApplicationController**

```ruby
class ApplicationController < ActionController::Base
  include RestingPug::Base
end
```

**3.** Don't forget to add a route to _**config/routes.rb**_

```ruby
Rails.application.routes.draw do
  resources :books
end
```

**4.** Enjoy your new API and don't hesitate to change it whatever you want!

If you want to learn what you can customize check the [Created Actions]({{ site.baseurl }}/0.1.1/actions) page.

Logo is [Designed by Freepik](https://www.freepik.com/free-vector/happy-pug-resting-on-the-sofa_1357299.htm)
