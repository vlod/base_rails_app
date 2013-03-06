base_rails_app
========

Dummy rails app template, so it's easier to start hacking and slashing.

Clone this repo, then to set it up for your project

    git clone git@github.com:vlod/base_rails_app.git MY_PROJECT
    cd MY_PROJECT
    
    # clear out the remote link to this project
    git remote rm origin

    # add a new origin that's been set up
    git remote add origin git@github.com:vlod/MY_PROJECT.git
    git remote show origin

If you favourite editor find all instances of DUMMY and replace them with MY_PROJECT.

Create config/application.yaml with situable values:

    development:
      db_username: root
      db_password: root
    production:
      db_username: root
      db_password: root
