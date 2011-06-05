var app, express;
express = require("express");
app = module.exports = express.createServer();
app.configure(function() {
  app.set("views", __dirname + "/views");
  app.set("view engine", "jade");
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.compiler({
    src: __dirname + "/public",
    enable: ['less']
  }));
  app.use(app.router);
  return app.use(express.static(__dirname + "/public"));
});
app.configure("development", function() {
  return app.use(express.errorHandler({
    dumpExceptions: true,
    showStack: true
  }));
});
app.configure("production", function() {
  return app.use(express.errorHandler);
});
app.get("/", function(req, res) {
  return res.render("index", {
    title: "my website"
  });
});
console.log("Express app listening on http://127.0.0.1:3000");
app.listen(3000);