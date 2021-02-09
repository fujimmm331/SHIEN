function allClear() {
  const clearBtnForRecordsFalse = document.getElementById("clear_btn_for_records_false")
  const clearBtnForRecordsTrue = document.getElementById("clear_btn_for_records_true")
  const clearBtnForColumnsFalse = document.getElementById("clear_btn_for_columns_false")
  const clearBtnForColumnsTrue = document.getElementById("clear_btn_for_columns_true")
  const checkBoxesForRecords = document.querySelectorAll(".checkbox_for_record")
  const checkBoxesForColumns = document.querySelectorAll(".checkbox_for_columns")
  
  clearBtnForRecordsFalse.addEventListener("click",function () {
    checkBoxesForRecords.forEach(function (checkBox) {
      checkBox.checked = false;
      clearBtnForRecordsFalse.setAttribute("style", "display:none;")
      clearBtnForRecordsTrue.removeAttribute("style", "display:none;")
    });
  });

  clearBtnForRecordsTrue.addEventListener("click",function () {
    checkBoxesForRecords.forEach(function (checkBox) {
      checkBox.checked = true;
      clearBtnForRecordsTrue.setAttribute("style", "display:none;")
      clearBtnForRecordsFalse.removeAttribute("style", "display:none;")
    });
  });

  

  clearBtnForColumnsFalse.addEventListener("click",function () {
    checkBoxesForColumns.forEach(function (checkBox) {
      checkBox.checked = false;
      clearBtnForColumnsFalse.setAttribute("style", "display:none;")
      clearBtnForColumnsTrue.removeAttribute("style", "display:none;")
    });
  });

  clearBtnForColumnsTrue.addEventListener("click",function () {
    checkBoxesForColumns.forEach(function (checkBox) {
      checkBox.checked = true;
      clearBtnForColumnsTrue.setAttribute("style", "display:none;")
      clearBtnForColumnsFalse.removeAttribute("style", "display:none;")
    });
  });

};

window.addEventListener("load", allClear);