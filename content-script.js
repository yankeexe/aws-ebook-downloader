const download = document.querySelector(".download-pdf")
if (download == null) {
  chrome.storage.local.set({ url: null })
} else {
  let downloadURL = download.getAttribute("href")
  chrome.storage.local.set({ url: downloadURL })
}
