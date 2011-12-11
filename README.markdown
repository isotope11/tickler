## Tickler

### Installation
First, get ruby 1.9.2+ installed on your machine.  I would suggest you do this /
manage the installation by way of [rvm](http://rvm.beginrescueend.com).

Once that's done, when you cd into the directory for the project it should
create the gemset for you.  Then install the required libraries by:

    gem install bundler
    bundle

Once that's done, you should be able to run the tests.

    bundle exec rake test

You should see them all pass.  It's working on your system at this point.

### License
MIT Licensed, see LICENSE.md for details
