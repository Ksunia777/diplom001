function deleteElement(event) {
    event.preventDefault();
    var element = event.target.parentNode;
    var id = element.dataset.id;
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