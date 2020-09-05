class DarkMode {
  constructor() {
    const saved = this.load()
    if (saved != undefined) {
      this.toggle(saved)
    }
  }

  load() {
    if (!window.sessionStorage) {
      return undefined
    }

    if (sessionStorage["darkMode"] == undefined) {
      return undefined
    }

    return JSON.parse(sessionStorage["darkMode"])
  }

  set(val) {
    if (!window.sessionStorage) {
      return
    }

    sessionStorage["darkMode"] = val
  }

  toggle(set) {
    const root = document.getElementsByTagName("html")[0]
    const mode = root.classList.toggle("dark-mode", set)
    this.set(mode)
  }

  handler() {
    this.toggle()
  }
}

const dm = new DarkMode()

document.addEventListener("DOMContentLoaded", () => {
  document
    .getElementById("dark-mode-switch-btn")
    .addEventListener("click", () => {
      dm.handler()
    })
})
