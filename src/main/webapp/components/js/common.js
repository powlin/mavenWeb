/**
 * 日期格式转化
 * @param date
 * @param format
 * @returns
 */
function dateFormat (date, format) {
	if(date == '' || typeof(date) == 'undefined'){
		return '-';
	}
     date = new Date(date);
     var o = {
         'M+' : date.getMonth() + 1, //month
         'd+' : date.getDate(), //day
         'H+' : date.getHours(), //hour
         'm+' : date.getMinutes(), //minute
         's+' : date.getSeconds(), //second
         'q+' : Math.floor((date.getMonth() + 3) / 3), //quarter
         'S' : date.getMilliseconds() //millisecond
     };
     if (/(y+)/.test(format)){
         format = format.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
     }
     for (var k in o){
         if (new RegExp('(' + k + ')').test(format)){
                 format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ('00' + o[k]).substr(('' + o[k]).length));
         }
     }
     return format;
}

/**
 * 金额格式转化
 * @param money
 * @param format
 */
function moneyFormat(money, format){
	if(isNaN(money)){
		return '';
	}
	return parseFloat(money/1000).toFixed(format);
}

/**
 * 申请编号去除特殊字符('-'与' ')
 * @param rbNo
 */
function rbNoFormat(rbNo){
	return rbNo.replace(/-| /g, "")
}

/**
 * 金额放大，乘于1000，格式化
 * @param money
 * @param format
 */
function moneyFormatByEnLarge(money, format){
	if(isNaN(money)){
		return '';
	}
	return parseFloat(money*1000).toFixed(format);
}

function checkData(colNames,isNulls,colValues,colLengths){
	for(var i=0;i < colValues.length;i++){
	    if(isNulls[i] == 1){
			if(undefined == colValues[i] || null == colValues[i] || '' == colValues[i]){
				 alert('提示:'+colNames[i]+'不能为空');
				 return false;
			}
		}
		
		if(undefined != colValues[i] && null != colValues[i] && '' != colValues[i] && colValues[i].length > colLengths[i]){
		 	alert('提示:'+colNames[i]+'长度不能超过'+colLengths[i]+'位');
		 	return false;
		}
	}
	return true;
}

function checkNum(amount,name){
	var reg = new RegExp("^[0-9]+(.[0-9]+)?$");
	if(!reg.test(amount)) { 
		alert(name+"只能输入数字！"); 
		return false; 
	}
}


/**
 * 提示信息显示隐藏
 * @param e
 */
function toggleMess(e){
	if($(e).val() != ""){
		$(e).next().addClass("hid");
	}else{
		$(e).next().removeClass("hid");
	}
}
