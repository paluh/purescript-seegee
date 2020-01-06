/* global exports, require, window */
/* jshint -W097 */

"use strict";

exports.devicePixelRatio = function() {
  if(window && window.devicePixelRatio) {
    return window.devicePixelRatio;
  }
  return 1.0;
};
