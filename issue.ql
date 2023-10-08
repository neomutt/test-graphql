query ($org: String = "neomutt", $repo: String = "neomutt", $number: Int!) {
  repository(owner: $org, name: $repo) {
    issue(number: $number) {
      title
      url
      author {
        login
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
