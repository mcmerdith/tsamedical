// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
ActiveStorage.start()
require('jquery');
require('foundation-sites');
require('motion-ui');

$(() => {
  Foundation.addToJquery($);
  $(document).foundation();
});

window.show = function(elem) {
  const $elem = (elem instanceof jQuery) ? elem : $(elem)
  $elem.removeClass('hide');
}

window.hide = function(elem) {
  const $elem = (elem instanceof jQuery) ? elem : $(elem)
  $elem.addClass('hide');
}
