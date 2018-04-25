

function intValedate() {
    var value = document.getElementById("id").value;
    var r = /^\+?[1-9][0-9]*$/;
    // alert(r.test(value));
    if(!r.test(value)) {
        document.getElementById("idSpan").innerText = "请输入正整数";
        return false;
    }else{
        document.getElementById("idSpan").innerText = "";
    }
}

function doubleValedate() {
    var normalPriceS = document.getElementById("normalPriceS").value;
    var normalPriceE = document.getElementById("normalPriceE").value;
    var memberPriceS = document.getElementById("memberPriceS").value;
    var memberPriceE = document.getElementById("memberPriceE").value;

    var r = /^\d\d*\.\d\d*$/
    // alert(r.test(normalPriceS))
    if(!r.test(normalPriceS) || !r.test(normalPriceE)){
        document.getElementById("normalPriceSpan").innerText ="请输入正数" ;
        return false;
    }else {
        document.getElementById("normalPriceSpan").innerText = "";
    }
    if(normalPriceE < normalPriceS){
        document.getElementById("normalPriceSpan").innerText ="最小价格不应该大于最大价格" ;
        return false;
    }else {
        document.getElementById("normalPriceSpan").innerText = "";
    }

    if(!r.test(memberPriceS) || !r.test(memberPriceE)){
        document.getElementById("memberPriceSpan").innerText ="请输入正数" ;
        return false;
    }else{
        document.getElementById("memberPriceSpan").innerText ="" ;
    }
    if(memberPriceE < memberPriceS) {
        document.getElementById("memberPriceSpan").innerText ="最小价格不应该大于最大价格" ;
        return false;
    }else{
        document.getElementById("memberPriceSpan").innerText ="" ;
    }
}

function dateValedate() {
    var productPDateS = document.getElementById("productPDateS").value;
    var productPDateE = document.getElementById("productPDateE").value;
    var productPdateSpan = document.getElementById("productPdateSpan");
    if(productPDateE < productPDateS){
        productPdateSpan.innerText = "查询产品最小日期应该小于最大日期";
        return false;
    }else {
        productPdateSpan.innerText = "";
    }
}

function check() {
    intValedate();
    doubleValedate();
    dateValedate();
    return true;
}




    function test() {
        alert("ok")
    }



