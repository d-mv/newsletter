document.getElementById("todayNow").innerHTML = formatAMPM();

function formatAMPM() {
  var d = new Date(),
    minutes = d.getMinutes().toString().length == 1 ? '0' + d.getMinutes() : d.getMinutes(),
    hours = d.getHours().toString().length == 1 ? '0' + d.getHours() : d.getHours(),
    ampm = d.getHours() >= 12 ? 'pm' : 'am',
    months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  return days[d.getDay()] + ' ' + months[d.getMonth()] + ' ' + d.getDate() + ' ' + d.getFullYear() + ' ' + hours + ':' + minutes + ampm;
}

function formatAMPM() {
  var hours=0,
  var d = new Date(),
    minutes = d.getMinutes().toString().length == 1 ? '0' + d.getMinutes() : d.getMinutes(),
    ampm = d.getHours() >= 12 ? 'pm' : 'am',
    months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Friday', 'Sat'];
  if (d.getHours() == 0) {
    hours = 12
  } else if (d.getHours() > 12) {
    hours = d.getHours() - 12
  } else {
    hours = d.getHours()
  };
  return days[d.getDay()] + ' ' + months[d.getMonth()] + ' ' + d.getDate() + ' ' + d.getFullYear() + ' ' + hours + ':' + minutes + ampm;
}

formatAMPM()