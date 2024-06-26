const iframe = document.querySelector("#uf-flipbook iframe")

if (iframe == null) {
  chrome.storage.local.set({ url: null })
} else {
  let iframeSrc = iframe.src
  chrome.storage.local.set({ awsEbookUrl: iframeSrc })
}
