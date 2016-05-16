#!/usr/bin/env nodejs
var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World, this is b-seated served by Nodejs\n');
}).listen(8080, 'localhost');
console.log('Server running at http://localhost:8080/');

