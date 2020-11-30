const initClipboard = () => {
  const clipboard = document.querySelector('.clipboard-btn');
  if (clipboard) {
    const newClipboard = new ClipboardJS(".clipboard-btn");
  }
}

export { initClipboard };
