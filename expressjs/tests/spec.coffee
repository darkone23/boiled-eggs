tobi = require "tobi"
should = require "should"
browser =  tobi.createBrowser 3000, "127.0.0.1"

browser.get "/", (res, $) ->
  res.should.have.status 200
  ($ "body").should.have.one "h1", "my website"
