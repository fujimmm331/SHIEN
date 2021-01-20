function exportCsvLink() {
  const chosedCsvExportLink = document.getElementById("chosed_csv_export_btn")
  const searchCsvExportLink = document.getElementById("search_csv_export_btn")
  const checkBoxes = document.querySelectorAll(".checkbox")
  let count = 0

  checkBoxes.forEach(function (checkBox) {
    checkBox.addEventListener("click",function(){
      chosedCsvExportLink.setAttribute("style", "display:block;")
      searchCsvExportLink.setAttribute("style", "display:none;")
      
    });
    if (checkBox.checked === false) {
      count = count + 1
    }
  });

  if (count === checkBoxes.length) {
    searchCsvExportLink.removeAttribute("style", "display:none;")
    chosedCsvExportLink.setAttribute("style", "display:none;")
  }
};
setInterval(exportCsvLink,500)