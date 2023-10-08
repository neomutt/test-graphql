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

## Scripts

These GraphQL scripts can be executed using the GitHub `gh` tool.
Most of them take named parameters.
Those marked with `!` are required -- they don't have default values.

| GraphQL                                      | Parameters (Required!)    | Description                                                    |
| :------------------------------------------- | :------------------------ | :------------------------------------------------------------- |
| [commit.ql](commit.ql)                       | org, repo, commit!        | Show the details of a commit                                   |
| [discussion.ql](discussion.ql)               | org, repo, number!        | Show the comments and reactions of a discussion                |
| [issue.ql](issue.ql)                         | org, repo, number!        | Overview of an Issue                                           |
| [multi.ql](multi.ql)                         | org, repo, number!        | Get an Issue/Pull Request/Discussion, without knowing the type |
| [org-repos.ql](org-repos.ql)                 | org, count                | List the first `$count` repos on `$org`                        |
| [pr.ql](pr.ql)                               | org, repo, number!        | Overview of a Pull Request                                     |
| [pr-checks.ql](pr-checks.ql)                 | org, repo, number!        | Show the checks run on a PR                                    |
| [pr-commits.ql](pr-commits.ql)               | org, repo, number!        | Show the commits and merge commit of a Pull Request            |
| [pr-paged.ql](pr-paged.ql)                   | org, repo, cursor         | Paged list of merged Pull Requests                             |
| [rate-limit.ql](rate-limit.ql)               |                           | Check how many queries have been used / are left               |
| [search-discussion.ql](search-discussion.ql) |                           | Search a NeoMutt discussion                                    |

```sh
gh api graphql -f query="$(cat rate-limit.ql)"
```

might return:

```json
{
  "data": {
    "rateLimit": {
      "cost": 1,
      "limit": 5000,
      "remaining": 4985,
      "used": 15,
      "resetAt": "2023-10-08T00:31:18Z",
      "nodeCount": 0
    }
  }
}
```

To specify parameters, use the `-F key=value` option:

```sh
gh api graphql -F org=neomutt -F repo=neomutt -F number=4037 -f query="$(cat pr-commits.ql)"
```

To get multiple pages of data, you can use the `endCursor` field and the `after` parameter:

```sh
# First run (no parameters)
gh api graphql -f query="$(cat pr-paged.ql)"
```

Output contains something like:

```
"pageInfo": {
  "hasNextPage": true,
  "endCursor": "Y3Vyc29yOnYyOpHOBjMBXA=="
}
```

To get the nex page, run:

```
gh api graphql -F cursor="Y3Vyc29yOnYyOpHOBjMBXA==" -f query="$(cat pr-paged.ql)"
```

