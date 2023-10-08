query ($org: String = "neomutt", $repo: String = "neomutt", $number: Int!) {
  repository(owner: $org, name: $repo) {
    discussion(number: $number) {
      title
      url
      upvoteCount
      author {
        login
      }
      comments(first: 50) {
        totalCount
        nodes {
          author {
            login
          }
          url
        }
      }
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
