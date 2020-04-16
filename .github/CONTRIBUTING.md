Contributing to Dontfile
======================

:+1::tada: First of all, thanks for taking the time to contribute! :tada::+1:

You can contribute in several ways:

* Write some code!
* Report an issue.
* Provide some documentation.
* Make a feature request.
* Share a success story.

Many people contribute to Dontfile by writing some code! Here's how:

1. [Fork](https://help.github.com/articles/fork-a-repo) Dontfile.
2. [Clone](https://help.github.com/articles/cloning-a-repository/) the forked
repository to your development or local machine.
3. Create a topic branch. - `git checkout -b my_branch`
4. Make your changes.
5. Add some tests to cover your changes.
5. Commit your changes to your branch.
6. Push your branch to your GitHub repo. - `git push origin my_branch`
7. Create a [Pull Request](http://help.github.com/pull-requests/) from your branch.
8. That's it!

If you're not doing some sort of refactoring, a CHANGELOG entry is appropriate.
Please include them in pull requests adding features or fixing bugs.

Tests
-----

We use `Minitest` for tests. A simple `rails test` will run all the tests. 
Make sure they pass when you submit a pull request.

Please include tests with your pull request.

Documentation
-------------

Writing docs is really important. If you are not comfortable with git, you can put documentation into an issue, and we'll get it into the application.

Please include docs in your pull requests.

Bugs & Feature Requests
-----------------------

You can file bugs on the [issues tracker](https://github.com/dontfile/dontfile/issues), and tag them with 'bug'.

When filing a bug, please follow these tips to help us help you:

### Good report structure

Please include the following four things in your report:

1. What you did.
2. What you expected to happen.
3. What happened instead.
4. What version of Dontfile you're using.

The more information, the better.

### Reproduction

If possible, please provide some sort of executable reproduction of the
issue.

### Version information

If you can't provide a reproduction, a copy of your Gemfile.lock would be helpful.
What browser(s) and OS experience the problem?
