{
  repository(owner: "neomutt", name: "neomutt") {
    issue(number: 3200) {
      title
      url
      author {
        login
      }
    }
    pullRequest(number: 3200) {
      title
      url
      author {
        login
      }
    }
    discussion(number: 3200) {
      title
      url
      author {
        login
      }
      comments(first: 0) {
        totalCount
      }
      category {
        emojiHTML
      }
    }
  }
}
