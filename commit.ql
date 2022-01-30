{
  repository(owner: "neomutt", name: "neomutt") {
    object(expression: "20211029") {
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
