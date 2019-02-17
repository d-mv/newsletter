document.getElementById("todayNow").innerHTML = currentTimestamp();

function currentTimestamp() {
	var hours = 0;
	var d = new Date(),
		minutes = d.getMinutes().toString().length == 1 ? '0' + d.getMinutes() : d.getMinutes(),
		ampm = d.getHours() >= 12 ? 'pm' : 'am',
		months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September',
			'October',
			'November', 'December'
		],
		days = ['Sunday', 'Monday', 'Tueday', 'Wedday', 'Thuday', 'Friday', 'Saturday'];
	if (d.getHours() == 0) {
		hours = 12
	} else if (d.getHours() > 12) {
		hours = d.getHours() - 12
	} else {
		hours = d.getHours()
	};
	return days[d.getDay()] + ', ' + months[d.getMonth()] + ' ' + d.getDate() + ', ' + d.getFullYear() +
		' | ' +
		hours + ':' +
		minutes + ampm;
}
