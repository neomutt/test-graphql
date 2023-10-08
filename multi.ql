query ($org: String = "neomutt", $repo: String = "neomutt", $number: Int!) {
  repository(owner: $org, name: $repo) {
    issue(number: $number) {
      title
      url
      author {
        login
      }
    }
    pullRequest(number: $number) {
      title
      url
      author {
        login
      }
    }
    discussion(number: $number) {
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
