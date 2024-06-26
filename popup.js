document.addEventListener("DOMContentLoaded", () => {
  document.getElementById("download-link").addEventListener("click", () => {
    chrome.storage.local.get(["awsEbookUrl"]).then((result) => {
      const ebookUrl = Object.values(result)[0]
      chrome.storage.local.clear()
      chrome.tabs.create({ url: ebookUrl })
    })
  })
})
