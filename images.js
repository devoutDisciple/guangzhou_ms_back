const images = require("images");
images("./2.jpg")
	.save("output.jpg", {               //Save the image to a file, with the quality of 50
		quality : 20                    //保存图片到文件,图片质量为50
	});
