document.querySelectorAll('.bid__menu').forEach(e => {
    let dropdown = e.querySelector('ul');
    dropdown.querySelectorAll('a').forEach(i =>{
        i.classList.add("w-full");
    });
    dropdown.className = "bid__dropdown invisible z-10 transition-all delay-75 absolute bg-gray-700 w-52 text-white mt-3 rounded-md left-0 py-1";
    let dropdownItem = dropdown.querySelectorAll('li');
    dropdownItem.forEach(item => {
        let arrow = document.createElement('span');
        arrow.setAttribute('class', "iconify text-lg");
        arrow.setAttribute('data-icon', "fe:arrow-right");

        item.className = "px-4 py-2 hover:bg-gray-600 flex justify-between items-center";
        let submenu = item.querySelector('ul');
        if (submenu != null) {
            item.classList.add("relative");
            item.classList.add("bid__submenu");
            submenu.className = "bid__submenu-dropdown z-10 invisible absolute bg-gray-700 w-52 text-white rounded-md left-full top-0 py-1";
            item.appendChild(arrow);
        }
    });

    e.querySelectorAll('a').forEach(archor => {
        archor.setAttribute("style", "color: inherit;text-decoration: inherit;");
    })
});