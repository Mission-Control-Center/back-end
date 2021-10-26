# README

* After cloning do `bundle` to install gems.
* Do `rails db:setup`
* Do `rails db:create && rails db:migrate` to setup db
* Do `rails server` to start the project.

## Suggested improvements
1. Adding uniqueness constraints to models
2. Using UUID instead of strings to index models. 
3. Adding authentication to individual requests (Right now auth routes are managed on the front-end for the sake of rapid development). 