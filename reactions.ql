{
  user(login: "flatcap") {
    repository(name: "dummy") {
      discussion(number: 26) {
        reactions(first: 10) {
          edges {
            node {
              content
              user {
                login
              }
            }
          }
        }
      }
    }
  }
}
