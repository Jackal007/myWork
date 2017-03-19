function add(name, price, id, stock) {

	if (stock == 0) {
		alert("库存不足，已提醒店家加菜 啦");
		return false;
	}

	// 总价
	document.getElementById("allPrice").innerHTML = parseInt(document
			.getElementById("allPrice").innerHTML)
			+ parseInt(price);

	// 减号按钮
	var dButton = document.createElement('button');
	dButton.innerHTML = '-';
	dButton.setAttribute("type", "button");
	dButton.setAttribute("onclick", "minus('" + id + "'," + price + ");");

	// 输入框，里面存着点的菜的数量，初始为1
	var Input = document.createElement('input');
	Input.setAttribute("class", "ng-pristine ng-valid");
	Input.setAttribute("style", "width: 15px;");
	Input.setAttribute("id", "quantity" + id);
	Input.setAttribute("value", "1");

	// 加号按钮
	var aButton = document.createElement('button');
	aButton.innerHTML = '+';
	aButton.setAttribute("type", "button");
	aButton.setAttribute("onclick", "plus('" + id + "'," + price + "," + stock
			+ ");");

	// 一个隐藏的input里面存着 dishID,price,quantity构成订单所需的信息
	var idInput = document.createElement('input');
	idInput.setAttribute("type", "hidden");
	idInput.setAttribute("name", id);
	idInput.setAttribute("id", "form" + id);
	idInput.setAttribute("value", price + "," + 1);

	var fDiv1 = document.createElement('div');
	fDiv1.setAttribute("class", "cell itemname ng-binding");
	fDiv1.innerHTML = name;

	var fDiv2 = document.createElement('div');
	fDiv2.setAttribute("class", "cell itemquantity");

	fDiv2.appendChild(dButton);
	fDiv2.appendChild(Input);
	fDiv2.appendChild(aButton);
	fDiv2.appendChild(idInput);

	// 这里展示的是一道菜的小计
	var fDiv3 = document.createElement('div');
	fDiv3.setAttribute("class", "cell itemtotal ng-binding");
	fDiv3.setAttribute("id", "totalPrice" + id);
	fDiv3.innerHTML = price;

	var sDiv = document.createElement('div');
	sDiv.setAttribute("class", "shop-cartbasket-tablerow ng-scope");
	sDiv.setAttribute("id", "div" + id);

	sDiv.appendChild(fDiv1);
	sDiv.appendChild(fDiv2);
	sDiv.appendChild(fDiv3);

	// 该变按钮中的字和颜色
	document.getElementById(id).innerHTML = '已加入购物车';
	document.getElementById(id).style.background = 'gray';
	document.getElementById(id).setAttribute("disabled", "true");

	document.getElementById("cart").appendChild(sDiv);

	return false;
}
function minus(id, price) {
	quantity = "quantity" + id;
	totalPrice = "totalPrice" + id;
	if (parseInt(document.getElementById(quantity).value) == 1) {
		var sDiv = document.getElementById("div" + id);
		document.getElementById("cart").removeChild(sDiv);
		var bt = document.getElementById(id);
		bt.removeAttribute("disabled");
		// 改变按钮中的字和颜色
		bt.innerHTML = '加入购物车';
		bt.style.background = '#0089dc';
		document.getElementById("allPrice").innerHTML = parseInt(document
				.getElementById("allPrice").innerHTML)
				- price;
	} else {
		document.getElementById(quantity).value = parseInt(document
				.getElementById(quantity).value) - 1;
		document.getElementById(totalPrice).innerHTML = parseInt(document
				.getElementById(totalPrice).innerHTML)
				- price;
		document.getElementById("allPrice").innerHTML = parseInt(document
				.getElementById("allPrice").innerHTML)
				- price;
		document.getElementById("form" + id).value = price + ","
				+ document.getElementById(quantity).value;
	}
}
function plus(id, price, stock) {
	quantity = "quantity" + id;
	totalPrice = "totalPrice" + id;
	if (parseInt(document.getElementById(quantity).value) < stock) {
		document.getElementById(quantity).value = parseInt(document
				.getElementById(quantity).value) + 1;
		document.getElementById(totalPrice).innerHTML = parseInt(document
				.getElementById(totalPrice).innerHTML)
				+ price;
		document.getElementById("allPrice").innerHTML = parseInt(document
				.getElementById("allPrice").innerHTML)
				+ price;
		document.getElementById("form" + id).value = price + ","
				+ document.getElementById(quantity).value;
	} else {
		alert("库存不足");
	}
}
