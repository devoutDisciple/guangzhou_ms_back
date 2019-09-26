const images = require("images");
const fs = require("fs");
let num = 1;

module.exports = {
	dealImages: async function(filePath) {
		try {
			fs.stat(filePath, (err, status) => {
				let size = Number.parseInt(Number(status.size) / 1024);
				if(size <= 100) {
					num = 1;
					return;
				}
				global.timer_myself = setTimeout(() => {
					let size2 = Number.parseInt(Number(status.size) / 1024);
					if(size2 >= 150) {
						num++;
						if(num > 15) {
							num = 1;
							return clearTimeout(global.timer_myself);
						}
						if(num < 5) images(filePath).save(filePath, {
							quality: Number.parseInt(Math.random() * 10) + 80
						});
						if(num >= 5 && num < 10)images(filePath).save(filePath, {
							quality: Number.parseInt(Math.random() * 10) + 70
						});
						if(num >= 10)images(filePath).save(filePath, {
							quality: Number.parseInt(Math.random() * 10) + 60
						});
						this.dealImages(filePath);
					}
				}, 2000);
			});
		} catch (error) {
			console.log(error);
		}
	}
};
