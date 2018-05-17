window.onload = function () {
    productCount()
    changeHref()
}

function addProduct() {
    var p = document.getElementById("productCount");
    var count = Number(p.value);
    count = count + 1;
    p.value = count;
    //更改href
    changeHref()

}

function removeProduct() {
    var p = document.getElementById("productCount");
    var count = Number(p.value);

    if(count <=0) {
        count = 0
    }else{
        count = count - 1;
    }
    p.value = count;
    //更改href
    changeHref()

}

function changeHref() {
    var b = document.getElementById("buy");
    var p = document.getElementById("productCount");
    var pCount = p.value;
    var hr = b.getAttribute("href")
    //更改购买网页中商品数量
    var reg = /count=\d*/;
    if(!reg.test(hr))
        hr += ("&count=" + pCount);
    if(reg.test(hr))
        hr = hr.replace(reg,"count="+pCount);

    b.setAttribute("href", hr);


}
