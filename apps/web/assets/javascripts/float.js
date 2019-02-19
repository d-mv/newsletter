const floatMenu = document.getElementById('float-menu')

floatMenu.addEventListener('click', (event) => {
	console.log(floatMenu.classList)
	if (floatMenu.classList == 'float-menu-open') {
		floatMenu.classList = 'float-menu'
	}
	else {floatMenu.classList = 'float-menu-open'}
})
