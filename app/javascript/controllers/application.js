import { Application } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

const application = Application.start()

// Configure Stimulus development experience
Turbo.start()
application.debug = false
window.Stimulus   = application

export { application }
