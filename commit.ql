query ($org: String = "neomutt", $repo: String = "neomutt", $commit: String!) {
  repository(owner: $org, name: $repo) {
    object(expression: $commit) {
      oid
      abbreviatedOid
      ... on Commit {
        signature {
          email
          signer {
            name
            login
          }
          state
        }
        authoredDate
        committedDate
        changedFiles
        url
        additions
        deletions
        messageHeadline
        author {
          name
          user {
            login
          }
        }
      }
    }
  }
}
