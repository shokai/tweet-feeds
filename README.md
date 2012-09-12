tweet-feeds
===========
feeds -> tweet

require
=======

* [MongoDB](http://www.mongodb.org/) 2.0+
* Ruby 1.8.7+


install
=======

    % git clone git://github.com/shokai/tweet-feeds.git
    % cd tweet-feeds

install rubygems

    % gem install bundler
    % bundle install


setup
=====

regist your app
---------------
regist your app [on twitter](http://twitter.com/apps/new)


edit config.yml
----------------

    % cp sample.config.yml config.yml

edit consumer key and secret.


auth
----

    % ruby bin/auth.rb

then, edit access token and secret


run
=====

    % ./run.sh

or

    % ruby bin/store.rb
    % ruby bin/tweet.rb



LICENSE
=======
(The MIT License)

Copyright (c) 2012 Sho Hashimoto

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.