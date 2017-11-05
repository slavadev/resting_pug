Contributing to Resting Pug
=====================

You're encouraged to submit [pull requests](https://github.com/korolvs/resting_pug/pulls), [propose features and discuss issues](https://github.com/korolvs/resting_pug/issues).

#### Fork the Project

Fork the [project on Github](https://github.com/korolvs/resting_pug) and check out your copy.

```
git clone https://github.com/contributor/resting_pug.git
cd resting_pug
git remote add upstream https://github.com/korolvs/resting_pug.git
```

#### Create a Topic Branch

Make sure your fork is up-to-date and create a topic branch for your feature or bug fix.

```
git checkout master
git pull upstream master
git checkout -b my-feature-branch
```

#### Bundle Install and Test

Ensure that you can build the project and run tests.

```
bundle install
cd spec/dummy
bundle exec rspec
```

#### Write Tests

Try to write a test that reproduces the problem you're trying to fix or describes a feature that you want to build. Add to [spec/dummy](spec/dummy).

We definitely appreciate pull requests that highlight or reproduce a problem, even without a fix.

#### Write Code

Implement your feature or bug fix.

Make sure that tests complete without errors.

#### Write Documentation

Document any external behavior in the [README](README.md).

#### Update Changelog

Add a line to [CHANGELOG](CHANGELOG.md) under **[Unreleased]**. Make it look like every other line.

#### Commit Changes

Make sure git knows your name and email address:

```
git config --global user.name "Your Name"
git config --global user.email "contributor@example.com"
```

Writing good commit logs is important. A commit log should describe what changed and why.

```
git add ...
git commit
```

#### Push

```
git push origin my-feature-branch
```

#### Make a Pull Request

Go to https://github.com/contributor/resting_pug and select your feature branch. Click the 'Pull Request' button and fill out the form. Pull requests are usually reviewed within a few days.

#### Thank You

Please do know that we really appreciate and value your time and work. You are the best!