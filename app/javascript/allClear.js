function allClear() {
  const clearBtn = document.getElementById("clear_btn")
  const checkBoxes = document.querySelectorAll(".checkbox")
  clearBtn.addEventListener("click",function () {
    checkBoxes.forEach(function (checkBox) {
      checkBox.checked = false
    });
  });

};

window.addEventListener("load", allClear);