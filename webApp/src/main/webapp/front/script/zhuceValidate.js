function usernameV() {
    var u = $("#username").val();
    if(u == "")
        document.getElementById("usernameSpan").innerText = "用户名不能为空";

}