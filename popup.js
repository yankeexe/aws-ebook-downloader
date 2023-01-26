document.addEventListener("DOMContentLoaded", () => {
  const link = document.getElementById("download-link")
  chrome.storage.local.get(["url"]).then((result) => {
    link.href = Object.values(result)
  })
  chrome.storage.local.clear()
})
