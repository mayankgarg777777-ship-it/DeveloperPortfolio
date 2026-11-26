# API Summary

## What Is a REST API?

A REST API lets one program request data or services from another program over the web. It uses URLs called endpoints and commonly returns data in JSON format, which programs can read and use.

## HTTP Status Codes

- **200 OK:** The request succeeded and the server returned a response.
- **404 Not Found:** The server could not find the requested resource.

## jq Filter

I used this filter to select fields from my GitHub profile JSON:

```bash
jq '{name: .name, repos: .public_repos, followers: .followers, joined: .created_at}' API/github_profile.json

## Status Check Results
GitHub profile endpoint: HTTP 200
Nonexistent endpoint: HTTP 404
