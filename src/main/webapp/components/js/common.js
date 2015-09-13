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

function checknumber(String) { 
	var Letters = "1234567890"; 
	var i; 
	var c; 
	for( i = 0; i < Letters.length(); i ++ )   {   //Letters.length() ->>>>取字符长度
		c = Letters.charAt( i ); 
		if (Letters.indexOf( c ) ==-1)   { //在"Letters"中找不到"c"   见下面的此函数的返回值
			return true; 
		} 
	}
	return false; 
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
