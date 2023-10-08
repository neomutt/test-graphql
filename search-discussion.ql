{
  search(first:10, query: "repo:neomutt/neomutt compose bigger", type: DISCUSSION) {
    nodes {
      ... on Discussion {
        title
        number
        url
      }
    }
  }
}
