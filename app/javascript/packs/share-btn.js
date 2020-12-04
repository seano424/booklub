const shareConfirmation = () => {
  const shareBtn = document.querySelector(".share-btn");
  if (shareBtn) {
    shareBtn.addEventListener("click", () => {
      document.getElementById("confirm-copy-flash").classList.toggle("show");
    });
  }
}

export { shareConfirmation }
