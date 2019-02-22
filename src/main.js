import "../less/main.less"

import { library, dom } from "@fortawesome/fontawesome-svg-core"
import { faEnvelopeOpen, faIdCard } from "@fortawesome/pro-light-svg-icons"
import {
	faFacebookF,
	faTwitter,
	faInstagram,
	faLinkedinIn,
	faGooglePlusG,
	faGithub,
} from "@fortawesome/free-brands-svg-icons"

library.add(faEnvelopeOpen, faIdCard)
library.add(
	faFacebookF,
	faTwitter,
	faInstagram,
	faLinkedinIn,
	faGooglePlusG,
	faGithub,
)
dom.i2svg()
