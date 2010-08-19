tweet-feeds
===========
tweet feeds

require
=======
DB

* [mongodb](http://www.mongodb.org/)

rubygems

* mongoid
* feed-normalizer
* twitter
* oauth

install
=======
    % git clone git://github.com/shokai/tweet-feeds.git
    % cd tweet-feeds

install rubygems

    % sudo gem install bundler
    % bundle install

setup
=====

regist your app
---------------
regist your app [on twitter](http://twitter.com/apps/new)


edit config.yaml
----------------

    % cp sample.config.yaml config.yaml

edit consumer key and secret.


auth
----

    % ruby auth.rb

then, edit access token and secret


run
=====

    % ruby store.rb
    % ruby tweet.rb