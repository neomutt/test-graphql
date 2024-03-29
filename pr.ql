query ($org: String = "neomutt", $repo: String = "neomutt", $number: Int!) {
  repository(owner: $org, name: $repo) {
    pullRequest(number: $number) {
      title
      url
      author {
        login
      }
      reviews(first: 10) {
        edges {
          node {
            state
            author {
              login
            }
          }
        }
      }
      state
      additions
      deletions
      changedFiles
      closed
      isDraft
      commits(first: 0) {
        totalCount
      }
      comments(first: 0) {
        totalCount
      }
      participants(first: 10) {
        edges {
          node {
            login
            name
          }
        }
      }
      labels(first: 10) {
        totalCount
        edges {
          node {
            name
            description
            color
          }
        }
      }
      assignees(first: 10) {
        edges {
          node {
            name
            login
          }
        }
      }
    }
  }
}
