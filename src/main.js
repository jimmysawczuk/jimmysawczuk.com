import "../scss/main.scss"
import "../scss/dark-mode-switch.scss"

import { library, dom } from "@fortawesome/fontawesome-svg-core"
import {
  faPaperPlane,
  faIdCard,
  faLightbulbSlash,
  faLightbulbOn,
} from "@fortawesome/pro-duotone-svg-icons"
import {
  faFacebookF,
  faTwitter,
  faInstagram,
  faLinkedinIn,
  faGithub,
  faTelegramPlane,
} from "@fortawesome/free-brands-svg-icons"

library.add(
  faPaperPlane,
  faIdCard,
  faLightbulbSlash,
  faLightbulbOn,

  faFacebookF,
  faTwitter,
  faInstagram,
  faLinkedinIn,
  faGithub,
  faTelegramPlane,
)

dom.i2svg()
