document.querySelectorAll('li[data-category]').forEach(category => {
    category.addEventListener('click', function (event) {
        event.preventDefault();

        document.querySelectorAll('li[data-category]').forEach(item => {
            item.classList.remove('active');
        });

        this.classList.add('active');
        document.querySelectorAll('.sub-dropdown').forEach(sub => {
            sub.style.display = 'none';
        });
        const subDropdown = this.querySelector('.sub-dropdown');
        if (subDropdown) {
            subDropdown.style.display = 'block';
        }
    });
});

