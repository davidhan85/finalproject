let storage = localStorage;
function doFirst(){
	let itemString = storage.getItem('addItemList') 
    let items = itemString.substring(0,itemString.length - 2).split(`, `)
    // console.log(items);     // ['A1001', 'A1005', 'A1006', 'A1002']

    newDiv = document.createElement('div')
    newTable = document.createElement('table')

    // 將 table 放進 div，再將 div 放進 cartList
    newDiv.appendChild(newTable)
    document.getElementById('cartList').appendChild(newDiv)
    
    total = 0
    for(let i = 0; i < items.length; i++){
        let itemInfo = storage.getItem(items[i])
        total += parseInt(itemInfo.split('|')[2])
        
        createCartList(items[i],itemInfo)
    }
    document.getElementById('total').innerText = total
}
function createCartList(itemId, itemValue){
    // alert(`${itemId}: ${itemValue}`)
    let itemTitle = itemValue.split('|')[0]
    let itemImage = 'imgs/' + itemValue.split('|')[1]
    let itemPrice = parseInt(itemValue.split('|')[2])

    // 建立每個品項的清單區域 -- tr
    let trItemList = document.createElement('tr')
    trItemList.className = 'item'

    newTable.appendChild(trItemList)

    // 建立商品圖片 -- 第一個 td
    let tdImage = document.createElement('td')
    tdImage.style.width = '200px'

    let image = document.createElement('img')
    image.src = itemImage
    image.width = 60

    tdImage.appendChild(image)
    trItemList.appendChild(tdImage)

    // 建立商品名稱和刪除按鈕-- 第二個 td
    let tdTitle = document.createElement('td')
    tdTitle.style.width = '280px'
    tdTitle.id = itemId

    let pTitle = document.createElement('p')
    pTitle.innerText = itemTitle

    // let delButton = document.createElement('button')
    // delButton.innerText = 'Delete'
    // delButton.addEventListener('click',deleteItem)

    tdTitle.appendChild(pTitle)
    // tdTitle.appendChild(delButton)
    trItemList.appendChild(tdTitle)

    // 建立商品價格 -- 第三個 td
    let tdPrice = document.createElement('td')
    tdPrice.style.width = '170px'

    let pPrice = document.createElement('p')
    pPrice.innerText = itemPrice

    tdPrice.appendChild(pPrice)
    trItemList.appendChild(tdPrice)

    // 建立商品數量 -- 第四個 td
    let tdItemCount = document.createElement('td')
    tdItemCount.style.width = '60px'

    let pItemCount = document.createElement('p')

    let inputItemCount = document.createElement('input')
    inputItemCount.type = 'number'
    inputItemCount.value = 1
    inputItemCount.min = 1
    inputItemCount.addEventListener('input',changeItemCount)

    pItemCount.appendChild(inputItemCount)
    tdItemCount.appendChild(pItemCount)
    trItemList.appendChild(tdItemCount)
}

    //第5個Total
    let tdTotal = document.createElement('td')
    tdTotal.style.width = '170px'

    let pTotal = document.createElement('p')
    pTotal.innerText = tdPrice.firstChild.innerText * inputItemCount.value

    tdTotal.appendChild(pTotal)
    trItemList.appendChild(tdTotal)





    //第6個刪除
    let delButton = document.createElement('button')
    delButton.innerText = 'Delete'
    delButton.addEventListener('click',deleteItem)
    let tdDelete = document.createElement('td')
    tdDelete.appendChild(delButton)
    trItemList.appendChild(tdDelete)


function deleteItem(e){
    // 先找到誰按的刪除按鈕?
    let itemId = e.target.parentNode.id
    // alert(itemId)

    // 扣除金額，若要完成作業也要修改這裡
    let itemValue = storage.getItem(itemId)
    total -= parseInt(itemValue.split('|')[2])

    document.getElementById('total').innerText = total

    // 清除 storage
    storage.removeItem(itemId)

    // let value = storage.getItem('addItemList')
    // let newValue = value.replace(`${itemId}, `,``)
    // storage.setItem('addItemList',newValue)

    storage['addItemList'] = storage['addItemList'].replace(`${itemId}, `,``)

    // 刪除該筆 <tr>
    // e.target.parentNode.parentNode.parentNode.removeChild(e.target.parentNode.parentNode)
    newTable.removeChild(e.target.parentNode.parentNode)
}
function changeItemCount(){
    alert(`這是改變數目`)
}
window.addEventListener('load', doFirst);