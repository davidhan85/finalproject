let storage = localStorage;
function doFirst(){
    if(storage['addItemList'] == null){
        storage['addItemList'] = ''     // storage.setItem('addItemList','')
    }

    //　幫每個 Add Cart 建立事件聆聽的功能
    let list = document.querySelectorAll('.addButton')  // list 是陣列

    for(let i = 0; i < list.length; i++){
        list[i].addEventListener('click', function(e){
            // let teddyInfo = document.getElementById(e.target.id).getElementsByTagName('input')[0].value
            let teddyInfo = document.querySelector(`#${e.target.id} input`).value
            // alert(teddyInfo)
            addItem(e.target.id, teddyInfo)
        })
    }
}
function addItem(itemId, itemValue){
    // alert(`${itemId}: ${itemValue}`)

    // JavaScript 原生程式
    // let image = document.createElement('img')
    // image.src = 'imgs/' + itemValue.split('|')[1]

    // let title = document.createElement('span')
    // title.innerText = itemValue.split('|')[0]

    // let price = document.createElement('span')
    // price.innerText = itemValue.split('|')[2]

    // let newItem = document.getElementById('newItem')
    // // 先在此處判斷是否已有物件，如果有要先刪除
    // // alert(newItem.childNodes.length)
    // while(newItem.childNodes.length >= 1){
    //     newItem.removeChild(newItem.firstChild)
    // }

    // 再顯示新物件
    // newItem.appendChild(image)
    // newItem.appendChild(title)
    // newItem.appendChild(price)

    // jQuery
    let theItem = `
        <img src="images/${itemValue.split('|')[1]}">
        <span>${itemValue.split('|')[0]}</span>
        <span>${itemValue.split('|')[2]}</span>
    `
    let newItem = document.getElementById('newItem')
    // 先判斷 newItem 是否已有子物件，如果有要先刪除
    while(newItem.childNodes.length >= 1){
        newItem.removeChild(newItem.firstChild)
    }

    // 再顯示新物件
    $('#newItem').append(theItem)    

    // 存入 storage
    if(storage[itemId]){
        alert(`You havbe checked.`)
    }else{
        storage['addItemList'] += `${itemId}, `
        storage.setItem(itemId, itemValue)
    }

    // 計算購買數量和小計
    let itemString = storage['addItemList']
    let items = itemString.substring(0, itemString.length - 2).split(`, `)
    // console.log(items);  // ['A1001', 'A1005', 'A1006', 'A1002']

    subtotal = 0
    for(let i = 0; i < items.length; i++){
        let itemInfo = storage.getItem(items[i])
        subtotal += parseInt(itemInfo.split('|')[2])
    }

    document.getElementById('itemCount').innerText = items.length
    document.getElementById('subtotal').innerText = subtotal

}
window.addEventListener('load', doFirst);