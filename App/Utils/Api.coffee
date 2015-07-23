
Api =
  getBio: (username) ->
    username = username.toLowerCase().trim()
    url = "https://api.github.com/users/#{username}"
    fetch(url).then((res) -> res.json())
  getRepos: (username) ->
    username = username.toLowerCase().trim()
    url = "https://api.github.com/users/#{username}/repos"
    fetch(url).then((res) -> res.json())
  getNotes: (username) ->
    username = username.toLowerCase().trim()
    url = "https://ddgithubnotetaker.firebaseio.com/#{username}.json"
    fetch(url).then((res) -> res.json())
  addNote: (username, note) ->
    username = username.toLowerCase().trim()
    url = "https://ddgithubnotetaker.firebaseio.com/#{username}.json"
    fetch url,
      method: 'POST'
      body: JSON.stringify note
    .then (res) -> res.json()

 module.exports = Api
