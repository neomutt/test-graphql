# GraphQL Sample Scripts

GitHub provides a REST API for its services so that users can automate tasks.
This has now been superceded by a GraphQL API which is even more powerful.

- **REST**: https://en.wikipedia.org/wiki/Representational_state_transfer
- **GraphQL**: https://en.wikipedia.org/wiki/GraphQL

This repo contains some simple scripts to perform complex queries in a single call.

## Explorer

GitHub provides an Explorer service.  Once logged in, you can run queries
against real data.  GraphQL is fully introspective and the Explorer is very well
documented.  (Hover over object to learn what they are, click for full docs)

- **Explorer**: https://docs.github.com/en/graphql/overview/explorer

The `.ql` scripts can be cut'n'pasted into the Explorer.

## Pre-requisites

To run the script, you'll need to install Python package: "requests".
You'll also need a "Personal Access Token" from GitHub.

- Go to: https://github.com/settings/tokens
- "Create new token"
- Save the token string

In your shell, create an environment variable, e.g.

- `export GITHUB_TOKEN="ghp_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"`

## Running

Now you can run the script.
It takes a number as an argument.
The number should be an Issue, Pull Request or Discussion number.

Here are some working examples:

```sh
# Pull Request
./graphql.py 3199

# Issue
./graphql.py 3200

# Discussion
./graphql.py 3203
```

