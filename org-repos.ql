query ($org: String = "neomutt", $count: Int = 10) {
  organization(login: $org) {
    description
    location
    login
    name
    repositories(first: $count) {
      nodes {
        name
      }
    }
  }
}
