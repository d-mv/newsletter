const floatMenu = document.getElementById('float-menu')
const floatMenuButton = document.getElementById('float-menu-button')

floatMenuButton.addEventListener('click', (event) => {
	console.log('button pressed')
	if (floatMenu.classList == 'float-menu-open') {
		floatMenu.classList = 'float-menu'
		floatMenuButton.classList = 'float-menu-button'
	}
	else {
		floatMenu.classList = 'float-menu-open'
		floatMenuButton.classList = 'float-menu-button-open'
	}
})
