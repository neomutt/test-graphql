query ($org: String = "neomutt", $repo: String = "neomutt", $cursor: String) {
  organization(login: $org) {
    repository(name: $repo) {
      pullRequests(first: 10, after: $cursor, states: MERGED) {
        nodes {
          number
          title
        }
        pageInfo {
          hasNextPage
          endCursor
        }
      }
    }
  }
}
