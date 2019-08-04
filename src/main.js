import "../less/main.less"

import { library, dom } from "@fortawesome/fontawesome-svg-core"
import { faEnvelopeOpen, faIdCard } from "@fortawesome/pro-duotone-svg-icons"
import {
	faFacebookF,
	faTwitter,
	faInstagram,
	faLinkedinIn,
	faGithub,
	faTelegramPlane,
} from "@fortawesome/free-brands-svg-icons"

library.add(faEnvelopeOpen, faIdCard)
library.add(
	faFacebookF,
	faTwitter,
	faInstagram,
	faLinkedinIn,
	faGithub,
	faTelegramPlane,
)
dom.i2svg()
