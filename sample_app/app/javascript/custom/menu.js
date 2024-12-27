document.addEventListener('turbo:load', () => {
    const hamburger = document.getElementById('hamburger')
    if (hamburger) {
        hamburger.addEventListener('click', (event) => {
            event.preventDefault()
            const menu = document.getElementById('navbar-menu')
            menu.classList.toggle('collapse')
        })
    }

    const account = document.getElementById('account')
    if (account) {
        account.addEventListener('click', (event) => {
            event.preventDefault()
            const accountMenu = document.getElementById('dropdown-menu')
            accountMenu.classList.toggle('active')
        })
    }
})