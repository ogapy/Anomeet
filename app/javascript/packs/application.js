import "@fortawesome/fontawesome-free/js/all";
import "../stylesheets/application";

require("@rails/ujs").start();
// require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("jquery");
const images = require.context("../images", true);
const imagePath = name => images(name, true);
