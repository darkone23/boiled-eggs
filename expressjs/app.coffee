express = require "express"
app = module.exports = express.createServer()

app.configure ->
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.compiler {
    src: __dirname + "/public"
    enable: ['less']
  }
  app.use app.router
  app.use express.static __dirname + "/public"

app.configure "development", ->
  app.use express.errorHandler
    dumpExceptions: true
    showStack: true

app.configure "production", ->
  app.use express.errorHandler

# define custom URL routes here

app.get "/", (req, res) ->
  res.render "index", {
    title: "my website"
  }

# start the server
console.log "Express app listening on http://127.0.0.1:3000"
app.listen 3000
