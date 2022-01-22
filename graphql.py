#!/usr/bin/python

# https://docs.github.com/en/graphql/overview/explorer

import requests
import os
import re
import sys
# from pprint import pprint

token = os.environ['GITHUB_TOKEN']

headers = {"Authorization": "token {}".format(token)}

# A simple function to use requests.post to make the API call.
# Note the json= section.
def run_query(query, variables):
    request = requests.post('https://api.github.com/graphql', json={'query': query, 'variables': variables}, headers=headers)
    if request.status_code == 200:
        return request.json()
    else:
        raise Exception("Query failed to run by returning code of {}. {}".format(request.status_code, query))

query = """
query ($num: Int!) {
  organization(login: "neomutt") {
    repository(name: "neomutt") {
      issue(number: $num) {
        title
        url
        author {
          login
        }
      }
      pullRequest(number: $num) {
        title
        url
        author {
          login
        }
      }
      discussion(number: $num) {
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
}
"""

variables = "{{ \"num\": {} }}".format(sys.argv[1])

result = run_query(query, variables)
# print("")
# pprint(result)
# print("")

repo = result["data"]["organization"]["repository"]
if bool(repo.get('discussion')):
    type = "Discussion"
    obj = repo["discussion"]
elif bool(repo.get('issue')):
    type = "Issue"
    obj = repo["issue"]
elif bool(repo.get('pullRequest')):
    type = "PR"
    obj = repo["pullRequest"]
else:
    print("unknown")
    exit()

print("Type:     ", type)
print("Title:    ", obj["title"])
print("Author:   ", obj["author"]["login"])
print("Url:      ", obj["url"])
if "comments" in obj:
    print("Comments: ", obj["comments"]["totalCount"])
if "category" in obj:
    print("Icon:     ", re.sub('<.*?>', '', obj["category"]["emojiHTML"]))

# print("{} Discussion by @{} '{}' ({}💬) {}".format(icon, author, title, comments, url))

# pprint(result)
