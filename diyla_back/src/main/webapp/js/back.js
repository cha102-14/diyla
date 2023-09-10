$("a.func_link").on("click",function(e){
    e.preventDefault();
    $("a.func_link").removeClass("chose");
    $(this).addClass("chose");
    
    let targetUrl = $(this).attr("href");
    $.ajax({
        url: targetUrl,
        success: function(response) {
          $("#content").html(response);
        },
        error: function() {
          // 載入失敗時的處理
        }
      });
});


