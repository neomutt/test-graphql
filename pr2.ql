
{
  repository(owner: "neomutt", name: "neomutt") {
    pullRequest(number: 3125) {
      number
      commits(last: 1) {
        nodes {
          commit {
            checkSuites(first: 10) {
              nodes {
                app {
                  name
                  description
                  slug
                  url
                }
                checkRuns(first: 10) {
                  nodes {
                    name
                    summary
                    text
                    title
                    resourcePath
                    externalId
                    steps(first:10){
                      nodes{
                        name
                        status
                      }
                    }
                    # detailsUrl
                  }
                }
                conclusion
                status
                workflowRun {
                  workflow {
                    name
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
