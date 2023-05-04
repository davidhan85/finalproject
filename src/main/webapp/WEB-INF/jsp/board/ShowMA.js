

window.onload = () => {
    const categoryButtons = document.querySelectorAll('.catebut');

    categoryButtons.forEach(button => {
        button.addEventListener('click', (event) => {
            event.preventDefault();

            const category = button.innerText;
            const paginationLinks = document.querySelectorAll('.pagination a');

            paginationLinks.forEach(link => {
                link.setAttribute('href', `${contextRoot}/board/ShowMainArticlesByCategory/category?p=${link.innerText}`);
            });
        });
    });
};


