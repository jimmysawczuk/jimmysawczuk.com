function toggleDarkMode(set) {
  const root = document.getElementsByTagName("html")[0]
  const mode = root.classList.toggle("dark-mode", set)
  sessionStorage["darkMode"] = mode
}

if (sessionStorage["darkMode"] != undefined) {
  const saved = JSON.parse(sessionStorage["darkMode"])
  toggleDarkMode(saved)
}

document.addEventListener("DOMContentLoaded", () => {
  document
    .getElementById("dark-mode-switch-btn")
    .addEventListener("click", () => {
      toggleDarkMode()
    })
})
