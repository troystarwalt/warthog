# Running this project

Try running this project by calling `rails server` from the shell.

# Running the database

This runs sqlite3 (`sqlite3` gem) in development and Postgres (`pg` gem) in production using [groups](http://bundler.io/groups.html) in bundler.

# Running Tests

You can run tests by calling `rake test` in your shell.

# Deploying to Heroku

```shell
$ cd warthog/
$ heroku create
Creating stark-fog-398... done, stack is cedar-14
http://stark-fog-398.herokuapp.com/ | https://git.heroku.com/stark-fog-398.git
Git remote heroku added
$ git remote -v
origin	https://github.com/shurane/warthog.git (fetch)
origin	https://github.com/shurane/warthog.git (push)
heroku	https://git.heroku.com/stark-fog-398.git (fetch)
heroku	https://git.heroku.com/stark-fog-398.git (push)
$ git push heroku master
<--- output from heroku servers --->
$ heroku run rake db:migrate
$ heroku run rake db:seed # optional
$ heroku open # opens the heroku link in your browser
```
