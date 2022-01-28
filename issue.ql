{
  organization(login: "neomutt") {
    repository(name: "neomutt") {
      issue(number: 2730) {
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
}
