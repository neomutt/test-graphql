#!/usr/bin/python

# https://docs.github.com/en/graphql/overview/explorer

import requests
import os
import re
import sys
# from pprint import pprint

token = os.environ['GITHUB_TOKEN']

headers = {"Authorization": "token {}".format(token)}

def run_query(query): # A simple function to use requests.post to make the API call. Note the json= section.
    request = requests.post('https://api.github.com/graphql', json={'query': query}, headers=headers)
    if request.status_code == 200:
        return request.json()
    else:
        raise Exception("Query failed to run by returning code of {}. {}".format(request.status_code, query))

num = sys.argv[1]

query = """
{{
  organization(login: "neomutt") {{
    repository(name: "neomutt") {{
      issue(number: {0}) {{
        title
        url
        author {{
          login
        }}
      }}
      pullRequest(number: {0}) {{
        title
        url
        author {{
          login
        }}
      }}
      discussion(number: {0}) {{
        title
        url
        author {{
          login
        }}
        comments(first: 0) {{
          totalCount
        }}
        category {{
          emojiHTML
        }}
      }}
    }}
  }}
}}
"""

result = run_query(query.format(sys.argv[1]))
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
