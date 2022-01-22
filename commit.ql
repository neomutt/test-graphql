{
  organization(login: "neomutt") {
    repository(name: "neomutt") {
      object(expression: "7d1cc22f1") {
        oid
        abbreviatedOid
        ... on Commit {
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
}
