#!/usr/bin/env phantomjs
'use strict';
var system = require('system');
var page = require('webpage').create();
page.viewportSize = { width: 900, height: 400 };
page.clipRect = { top: 0, left: 0, width: 800, height: 150 };
page.open(system.args[1], function(status) {
  if (status === "success") {
    var title = page.evaluate(function() {
      document.body.style.backgroundColor = "white";
      return;
    });

    // console.log(title);
    page.render(system.args[2]);
    phantom.exit();

  } else {
   phantom.exit(2);
  }
});
