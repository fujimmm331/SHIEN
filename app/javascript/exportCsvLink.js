function exportCsvLink() {
  const chosedCsvExportLink = document.getElementById("chosed_csv_export_btn")
  const searchCsvExportLink = document.getElementById("search_csv_export_btn")
  const checkBoxesForRecord = document.querySelectorAll(".checkbox_for_record")
  const checkBoxesForColumns = document.querySelectorAll(".checkbox_for_columns")
  let count = 0

  checkBoxesForRecord.forEach(function (checkBoxForRecord) {
    
    // if (checkBoxForRecord.checked === false) {
    //   count = count + 1
    //   console.log(count)
    // }

    checkBoxForRecord.addEventListener("click", () => {
    if (checkBoxForRecord.checked === false) {
      count = count + 1
      console.log(count)
    } 
      searchCsvExportLink.setAttribute("style", "display:none;")
    });


  });

  if (count === checkBoxesForRecord.length) {
    searchCsvExportLink.removeAttribute("style", "display:none;")
    chosedCsvExportLink.setAttribute("style", "display:none;")
  }
};


window.addEventListener("load",exportCsvLink)
// setInterval(exportCsvLink, 500);
