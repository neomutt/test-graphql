query ($org: String = "neomutt", $repo: String = "neomutt", $number: Int!) {
  organization(login: $org) {
    repository(name: $repo) {
      pullRequest(number: $number) {
        number
        title
        merged
        commits(first: 10) {
          nodes {
            commit {
              messageHeadline
              oid
            }
          }
        }
        mergeCommit {
          messageHeadline
          oid
        }
      }
    }
  }
}
