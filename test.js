//引入模块
var http = require("http");
var qs = require("querystring");
var crypto = require("crypto");

var USER = "1094705507@qq.com"; //必填，飞鹅云 www.feieyun.cn后台注册的账号名
var UKEY = "SLb59vd942z9sGRV"; //必填，飞鹅云后台注册账号后生成的UKEY

//以下URL参数不需要修改
var HOST = "api.feieyun.cn"; //域名
var PATH = "/Api/Open/"; //接口路径

function signature(STIME){
	return crypto.createHash("sha1").update(USER+UKEY+STIME).digest("hex");//获取签名
}


function print(sn) {

	//标签说明：
	//单标签:
	//"<BR>"为换行,"<CUT>"为切刀指令(主动切纸,仅限切刀打印机使用才有效果)
	//"<LOGO>"为打印LOGO指令(前提是预先在机器内置LOGO图片),"<PLUGIN>"为钱箱或者外置音响指令
	//成对标签：
	//"<CB></CB>"为居中放大一倍,"<B></B>"为放大一倍,"<C></C>"为居中,<L></L>字体变高一倍
	//<W></W>字体变宽一倍,"<QR></QR>"为二维码,"<BOLD></BOLD>"为字体加粗,"<RIGHT></RIGHT>"为右对齐
	//拼凑订单内容时可参考如下格式
	//根据打印纸张的宽度，自行调整内容的格式，可参考下面的样例格式

	var orderInfo;
	orderInfo = "<CB>贝沃思美食</CB><BR>"; //标题字体如需居中放大,就需要用标签套上
	orderInfo += "<C>一点点奶茶</C><BR>"; //标题字体如需居中放大,就需要用标签套上
	orderInfo += "名称　　　　　 单价  数量 金额<BR>";
	orderInfo += "-------------------------------<BR>";
	orderInfo += "番　　　　　　 1.0    1   1.0<BR>";
	orderInfo += "番茄　　　　　 10.0   10  10.0<BR>";
	orderInfo += "番茄炒　　　　 10.0   100 100.0<BR>";
	orderInfo += "番茄炒粉　　　 100.0  100 100.0<BR>";
	orderInfo += "番茄炒粉粉　　 1000.0 1   100.0<BR>";
	orderInfo += "番茄炒粉粉粉粉 100.0  100 100.0<BR>";
	orderInfo += "番茄炒粉粉粉粉 15.0   1   15.0<BR>";
	orderInfo += "备注：快点送到北京大学<BR>";
	orderInfo += "--------------------------------<BR>";
	orderInfo += "合计：238 元<BR>";
	orderInfo += "送货地点：hello<BR>";
	orderInfo += "联系电话：138000000000<BR>";
	orderInfo += "订餐时间：2019-08-03 23:30:10<BR><BR>";
	var STIME = Math.floor(new Date().getTime() / 1000); //请求时间,当前时间的秒数
	var post_data = {
		user: USER, //账号
		stime: STIME, //当前时间的秒数，请求时间
		sig: signature(STIME), //签名
		apiname: "Open_printMsg", //不需要修改
		sn: sn, //打印机编号
		content: orderInfo, //打印内容
		times: "1" //打印联数,默认为1
	};
	var content = qs.stringify(post_data);
	var options = {
		hostname: HOST,
		port: 80,
		path: PATH,
		method: "POST",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
		}
	};
	var req = http.request(options, function (res) {
		res.setEncoding("utf-8");
		res.on("data", function (response) {
			//response是返回的JSON字符串
			//服务器返回值，建议要当做日志记录起来
			console.log(response);
		});
	});
	req.on("error", function () {
		console.log("error!");
	});
	req.write(content);
	req.end();
}

print("920535072");
