const title = document.getElementById('title')

title.addEventListener('click', event => {
	window.location.href = '/'
})
title.addEventListener('dblclick', event => {
	window.location.href = '#title'
})

