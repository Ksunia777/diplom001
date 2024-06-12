function deleteElement(event) {
    event.preventDefault();
    var element = event.target.parentNode;
    const targetTd = event.target.closest('td[data-element-id]');

    // Получаем значение data-element-id из элемента td
    const id = targetTd.dataset.elementId;
    var csrftoken = "jhgjhgjh";
  
    $.ajax({
      method: "POST",
      url: "/user/del/",
      data: {
       id: id,
        csrfmiddlewaretoken: csrftoken
      },
      success: function(data) {
        element.parentNode.removeChild(element);
      },
      error: function(data) {
              element.parentNode.removeChild(element);
  
        console.log("Error:", data);
      }
    });
  }
