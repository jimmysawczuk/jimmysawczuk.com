import "../scss/resume.scss"
import "../scss/dark-mode-switch.scss"

import { library, dom } from "@fortawesome/fontawesome-svg-core"
import {
  faLightbulbSlash,
  faLightbulbOn,
} from "@fortawesome/pro-duotone-svg-icons"

library.add(faLightbulbSlash, faLightbulbOn)

dom.i2svg()

function setPrintDate(el) {
  var d = new Date()
  var months = {
    0: "Jan",
    1: "Feb",
    2: "Mar",
    3: "Apr",
    4: "May",
    5: "Jun",
    6: "Jul",
    7: "Aug",
    8: "Sep",
    9: "Oct",
    10: "Nov",
    11: "Dec",
  }

  var fmted =
    d.getUTCDate() + " " + months[d.getUTCMonth()] + " " + d.getUTCFullYear()
  el.innerHTML = fmted
}

setPrintDate(document.getElementById("print-date"))
