## Tickler

This is an application intended to manage a 43folders style tickler file.  The
metaphor is 43 physical folders, inside of which are cards that correspond to
tasks to be taken care of.

The folders are labeled 1-31 and jan-dec.  On the 1st day of each month, you
open that month's folder and distribute all of the tasks inside of it to the
folders representing the day you intend to take care of them.  You take care of
each daily folder on the day it comes up.  You either handle or defer every task
in the folder every day.

This app is hosted at http://tickler-app.heroku.com.  You can register and play
around with it there, and it's going to stick around indefinitely so feel free
to use it as well I suppose :)  Or just launch your own, it's open source.

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
