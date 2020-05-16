import "../scss/main.scss"

import { library, dom } from "@fortawesome/fontawesome-svg-core"
import {
  faPaperPlane,
  faIdCard,
  faMoon,
  faSun,
  faToggleOn,
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
  faMoon,
  faSun,
  faToggleOn,

  faFacebookF,
  faTwitter,
  faInstagram,
  faLinkedinIn,
  faGithub,
  faTelegramPlane,
)

dom.i2svg()
