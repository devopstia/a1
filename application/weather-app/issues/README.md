## Issues
- We have issues with the auth because it looks like it was ising the DB service name to login into the database instead of using the hostname. Those service the DB service name was hardcoded in the code as db.
- Cache issue: we Clear Docker Cache with docker builder prune --all

