
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

function password2V() {
    var p = $("#password").val();
    var p2 = $("#password2").val();
    if(p == "")
        document.getElementById("password2Span").innerText = "请验证密码";
    else if(p != p2)
        document.getElementById("password2Span").innerText = "密码确认有误";
    else
        document.getElementById("password2Span").innerText = "";
}

function phoneV() {
    var ph = $("#phone").val();
    if(ph == "")
        document.getElementById("phoneSpan").innerText = "请输入电话号码";

    else
        document.getElementById("phoneSpan").innerText = "";
}

function addrV() {
    var addr = $("#addr").val();
    if(addr == "")
        document.getElementById("addrSpan").innerText = "请输入配送地址";
    else
        document.getElementById("addrSpan").innerText = "";

}
