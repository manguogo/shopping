
function usernameV() {
    var u = $("#username").val();
    if(u == "")
        document.getElementById("usernameSpan").innerText = "用户名不能为空";
    else
        document.getElementById("usernameSpan").innerText = "";

}

function passwordV() {
    var p = $("#password").val();
    if(p == "")
        document.getElementById("passwordSpan").innerText = "密码不能为空";
    else
        document.getElementById("passwordSpan").innerText = "";
}



