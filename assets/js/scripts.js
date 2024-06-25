const overlay = document.getElementById("formBook");

// Web Storage
const STORAGE_KEY = "BOOKSHELF_APPS";
const SAVED_EVENT = "saved-book";

// memeriksa apakah localStorage didukung oleh browser atau tidak
function storageExist() {
    if (typeof Storage === undefined) {
        alert(
            "Unfortunately, your browser does not support local storage."
        );
        return false;
    }
    return true;
}

// menyimpan data ke localStorage based on Key yang sudah ditetapkan sebelumnya.
function saveData() {
    if (storageExist()) {
        const parsed /* string */ = JSON.stringify(books);
        localStorage.setItem(STORAGE_KEY, parsed);
        document.dispatchEvent(new Event("SAVED_EVENT"));
    }
}

document.addEventListener(SAVED_EVENT, function () {
    console.log(localStorage.getItem(STORAGE_KEY));
});

// memuat data dari localStorage & memasukkan data hasil parsing ke variabel books
function loadDataFromStorage() {
    const serializedData /* string */ =
        localStorage.getItem(STORAGE_KEY);
    let data = JSON.parse(serializedData);

    if (data !== null) {
        for (const book of data) {
            books.push(book);
        }
    }

    document.dispatchEvent(new Event(RENDER_EVENT));
}

// add preventDefault on DOMContentLoaded
document.addEventListener("DOMContentLoaded", function () {
    const submitForm = document.getElementById("inputBook");
    submitForm.addEventListener("submit", function (event) {
        event.preventDefault();
        if (isEdit == true) {
            saveEditBook();
            x;
        } else {
            addBook();
        }
        clear();
        selectedEditBook.splice(0, selectedEditBook.length);
    });

    if (storageExist()) {
        loadDataFromStorage();
    }
});

// clear value
function clear() {
    document.getElementById("inputBookTitle").value = "";
    document.getElementById("inputBookAuthor").value = "";
    document.getElementById("inputBookYear").value = "";
    document.getElementById("inputBookCategory").value = "";
    document.getElementById("inputBookIsComplete").checked = false;
}

// var book
const books = [];
const RENDER_EVENT = "render-book";

function generateId() {
    return +new Date();
}

// return book
function generateBookObject(
    id,
    title,
    author,
    year,
    category,
    isCompleted
) {
    return {
        id,
        title,
        author,
        year,
        category,
        isCompleted,
    };
}

// render event
document.addEventListener(RENDER_EVENT, function () {
    console.log(books);
});

document.addEventListener(RENDER_EVENT, () => {
    const unfinished = document.getElementById(
        "incompleteBookshelfList"
    );
    const finished = document.getElementById(
        "completeBookshelfList"
    );

    unfinished.innerHTML = "";
    finished.innerHTML = "";

    for (const book of books) {
        const bookElement = newBook(book);
        if (book.isCompleted) {
            finished.append(bookElement);
        } else {
            unfinished.append(bookElement);
        }
    }
});

// function to add book
function addBook() {
    isEdit = false;
    const title = document.getElementById("inputBookTitle").value;
    const author = document.getElementById("inputBookAuthor").value;
    const year = document.getElementById("inputBookYear").value;
    const category = document.getElementById(
        "inputBookCategory"
    ).value;
    const isCompleted = document.getElementById(
        "inputBookIsComplete"
    ).checked;

    const generateID = generateId();
    const bookObject = generateBookObject(
        generateID,
        title,
        author,
        year,
        category,
        isCompleted
    );
    books.push(bookObject);

    document.dispatchEvent(new Event(RENDER_EVENT));

    saveData();
}

// function to create a new book
function newBook(bookObject) {
    const img = document.createElement("img");
    img.setAttribute("src", "assets/images/cover.jpg");

    // card image
    const cardImage = document.createElement("div");
    cardImage.classList.add("unfinished-item");
    cardImage.append(img);

    // card-body>content
    const bookTitle = document.createElement("h2");
    bookTitle.innerText = bookObject.title;

    const bookAuthor = document.createElement("h3");
    bookAuthor.innerText = `By: ${bookObject.author}`;

    const bookYear = document.createElement("h4");
    bookYear.innerText = `Year Published: ${bookObject.year}`;

    const bookCategory = document.createElement("h5");
    bookCategory.innerText = `Genre: ${bookObject.category}`;

    const content = document.createElement("article");
    content.classList.add("book-content");
    content.append(bookTitle, bookAuthor, bookYear, bookCategory);

    // card-body>action
    const action = document.createElement("div");
    action.classList.add("button-action");

    if (bookObject.isCompleted) {
        const undoButton = createButton(
            "button-check",
            "check_circle",
            function () {
                addUnfinished(bookObject.id);
            }
        );

        const editButton = createButton(
            "button-edit",
            "edit",
            function () {
                editBook(bookObject.id);
            }
        );

        const deleteButton = createButton(
            "button-delete",
            "delete",
            function () {
                deleteBook(bookObject.id);
            }
        );

        action.append(undoButton, editButton, deleteButton);
    } else {
        const doneButton = createButton(
            "button-check",
            "check_circle",
            function () {
                addFinished(bookObject.id);
            }
        );

        const editButton = createButton(
            "button-edit",
            "edit",
            function () {
                editBook(bookObject.id);
            }
        );

        const deleteButton = createButton(
            "button-delete",
            "delete",
            function () {
                deleteBook(bookObject.id);
            }
        );

        action.append(doneButton, editButton, deleteButton);
    }

    content.append(action);

    const card = document.createElement("div");
    card.classList.add(
        bookObject.isCompleted ? "finished-item" : "unfinished-item"
    );
    card.append(img, content);

    return card;
}

function createButton(buttonClass, iconName, eventListener) {
    const button = document.createElement("button");
    button.classList.add(buttonClass);

    const icon = document.createElement("i");
    icon.classList.add("material-symbols-outlined");
    icon.innerText = iconName;

    button.append(icon);
    button.addEventListener("click", eventListener);

    return button;
}

// function to add unfinished book
function addUnfinished(bookId) {
    const bookTarget = findBook(bookId);

    if (bookTarget == null) return;

    bookTarget.isCompleted = false;
    document.dispatchEvent(new Event(RENDER_EVENT));

    saveData();
}

// function to add finished book
function addFinished(bookId) {
    const bookTarget = findBook(bookId);

    if (bookTarget == null) return;

    bookTarget.isCompleted = true;
    document.dispatchEvent(new Event(RENDER_EVENT));

    saveData();
}

const selectedEditBook = [];
var isEdit = false;

// function to edit book
function editBook(bookId) {
    isEdit = true;
    const bookTarget = findBook(bookId);

    if (bookTarget == null) return;

    selectedEditBook.push(bookTarget);
    overlay.style.display = "flex";
    document.getElementById("inputBookTitle").value =
        bookTarget.title;
    document.getElementById("inputBookAuthor").value =
        bookTarget.author;
    document.getElementById("inputBookYear").value =
        bookTarget.year;
    document.getElementById("inputBookCategory").value =
        bookTarget.category;
    document.getElementById("inputBookIsComplete").checked =
        bookTarget.isCompleted;

    const h2 = document.querySelector(
        ".input_section .title-input h2"
    );
    h2.innerText = "Form Edit";

    const editNameButton = document.getElementById("bookSubmit");
    editNameButton.innerText = "Edit Book";
}

function saveEditBook() {
    isEdit = false;
    const getBookId = selectedEditBook[0].id;
    const title = document.getElementById("inputBookTitle").value;
    const author = document.getElementById("inputBookAuthor").value;
    const year = document.getElementById("inputBookYear").value;
    const category = document.getElementById(
        "inputBookCategory"
    ).value;
    const isCompleted = document.getElementById(
        "inputBookIsComplete"
    ).checked;

    const bookTarget = findBook(getBookId);

    if (bookTarget == null) return;

    bookTarget.id = getBookId;
    bookTarget.title = title;
    bookTarget.author = author;
    bookTarget.year = year;
    bookTarget.category = category;
    bookTarget.isCompleted = isCompleted;

    selectedEditBook.splice(0, selectedEditBook.length);
    document.dispatchEvent(new Event(RENDER_EVENT));
    saveData();
}

// function to delete book
function deleteBook(bookId) {
    const bookTarget = findBookIndex(bookId);

    if (bookTarget == -1) return;

    const confirmDelete = confirm(
        "Kamu akan menghapus buku ini dari list, apakah Kamu yakin?"
    );
    if (confirmDelete === true) {
        books.splice(bookTarget, 1);
        document.dispatchEvent(new Event(RENDER_EVENT));
    } else {
        return;
    }

    saveData();
}

// function to findbook
function findBook(bookId) {
    for (const book of books) {
        if (book.id === bookId) {
            return book;
        }
    }
    return null;
}

function findBookIndex(bookId) {
    for (const index in books) {
        if (books[index].id === bookId) {
            return index;
        }
    }
    return -1;
}

// searchBook
const search = document.getElementById("searchBookTitle");

search.addEventListener("keyup", function (event) {
    const searchBook = event.target.value.toLowerCase();
    const listBooks = document.querySelectorAll(
        ".book_list article"
    );

    listBooks.forEach((book) => {
        const bookTitle = book
            .querySelector(".content h3")
            .innerText.toLowerCase();
        if (bookTitle.includes(searchBook)) {
            book.style.display = "flex";
        }
    });
});

const searchSubmit = document.getElementById("searchSubmit");

searchSubmit.addEventListener("click", function (event) {
    event.preventDefault();
});
