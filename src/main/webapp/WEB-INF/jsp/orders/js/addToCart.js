
addToCart() ;{
// 由于cookie大小限制为4k，另外课程第一阶段是没有redis的，所以相关暂存性内容会存入到cookie中
var shopcartCounts = app.getShopcartItemCounts();
if (shopcartCounts >= 8) {
    alert("您购物车中的食物太多啦~请把它们带回家吧~！");
    return;
}

// 创建购物车对象
var item = this.item;
var itemImgList = this.itemImgList;
var selectedSku = this.selectedSku;

var tmpBuyCounts = this.buyCounts;
tmpBuyCounts = parseInt(tmpBuyCounts);
if (typeof (tmpBuyCounts) != "number") {
    alert("购买数量不能为非数字！");
    // tmpBuyCounts = 1;
    this.buyCounts = 1;
    return;
}

// 构建购物车商品对象
var shopcartItem = new app.ShopcartItem(item.id,
    itemImgList[0].url,
    item.itemName,
    selectedSku.id,
    selectedSku.name,
    tmpBuyCounts,
    selectedSku.priceDiscount,
    selectedSku.priceNormal);
// console.log(shopcartItem);
// 添加商品至购物车list
app.addItemToShopcart(shopcartItem);

// 购物车应该在登录/注册的时候同步

// 判断当前用户是否登录，如果登录，则把购物车数据发送至后端（后端需要合并已存在的商品）
var userIsLogin = this.userIsLogin;
if (userIsLogin) {
    var userInfo = this.userInfo;
    var serverUrl = app.serverUrl;
    axios.defaults.withCredentials = true;
    axios.post(
            serverUrl + '/shopcart/add?userId=' + userInfo.id,
            shopcartItem, {
                headers: {
                    'headerUserId': userInfo.id,
                    'headerUserToken': userInfo.userUniqueToken
                }
            })
        .then(res => {
            if (res.data.status == 200) {

            } else if (res.data.status == 500) {
                alert(res.data.msg);
            }
        });
}

alert("商品添加至购物车成功！");

// 以下仅供测试观察数据
// var foodieShopcartCookie = app.getCookie("shopcart");
// var foodieShopcart = [];
// if (foodieShopcartCookie != null && foodieShopcartCookie != "" && foodieShopcartCookie != undefined) {
// 	var foodieShopcartStr = decodeURIComponent(foodieShopcartCookie);
// 	foodieShopcart = JSON.parse(foodieShopcartStr);
// }
// console.log(foodieShopcart);

// 刷新购物车数量
this.shopcartItemCounts = app.getShopcartItemCounts();
}