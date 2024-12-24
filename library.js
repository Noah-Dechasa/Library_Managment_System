
const authors = [
    { id: 1, firstName: "J.K.", lastName: "Rowling", nationality: "British" },
    { id: 2, firstName: "George", lastName: "Orwell", nationality: "British" },
    { id: 3, firstName: "Jane", lastName: "Austen", nationality: "British" },
    { id: 4, firstName: "Mark", lastName: "Twain", nationality: "American" },
    { id: 5, firstName: "Agatha", lastName: "Christie", nationality: "British" },
    { id: 6, firstName: "F. Scott", lastName: "Fitzgerald", nationality: "American" },
    { id: 7, firstName: "Ernest", lastName: "Hemingway", nationality: "American" },
    { id: 8, firstName: "Mary", lastName: "Shelley", nationality: "British" },
    { id: 9, firstName: "Stephen", lastName: "King", nationality: "American" },
    { id: 10, firstName: "Suzanne", lastName: "Collins", nationality: "American" },
    { id: 11, firstName: "Rick", lastName: "Riordan", nationality: "American" },
    { id: 12, firstName: "Chimamanda", lastName: "Adichie", nationality: "Nigerian" },
    { id: 13, firstName: "Haruki", lastName: "Murakami", nationality: "Japanese" },
    { id: 14, firstName: "Isabel", lastName: "Allende", nationality: "Chilean" },
    { id: 15, firstName: "Gabriel", lastName: "Garcia Marquez", nationality: "Colombian" },
    { id: 16, firstName: "Toni", lastName: "Morrison", nationality: "American" },
    { id: 17, firstName: "Neil", lastName: "Gaiman", nationality: "British" },
    { id: 18, firstName: "Margaret", lastName: "Atwood", nationality: "Canadian" },
    { id: 19, firstName: "James", lastName: "Patterson", nationality: "American" },
    { id: 20, firstName: "Daphne", lastName: "du Maurier", nationality: "British" }
];

const books = [
    { id: 1, title: "Harry Potter and the Sorcerer's Stone", authorId: 1, genre: "Fantasy", status: "Available" },
    { id: 2, title: "1984", authorId: 2, genre: "Dystopian", status: "Checked Out" },
    { id: 3, title: "Pride and Prejudice", authorId: 3, genre: "Romance", status: "Available" },
    { id: 4, title: "The Adventures of Tom Sawyer", authorId: 4, genre: "Adventure", status: "Available" },
    { id: 5, title: "And Then There Were None", authorId: 5, genre: "Mystery", status: "Checked Out" },
    { id: 6, title: "The Great Gatsby", authorId: 6, genre: "Classic", status: "Available" },
    { id: 7, title: "The Old Man and the Sea", authorId: 7, genre: "Fiction", status: "Available" },
    { id: 8, title: "Frankenstein", authorId: 8, genre: "Horror", status: "Available" },
    { id: 9, title: "The Shining", authorId: 9, genre: "Horror", status: "Checked Out" },
    { id: 10, title: "The Hunger Games", authorId: 10, genre: "Sci-Fi", status: "Available" },
    { id: 11, title: "Percy Jackson: The Lightning Thief", authorId: 11, genre: "Fantasy", status: "Checked Out" },
    { id: 12, title: "Half of a Yellow Sun", authorId: 12, genre: "Historical Fiction", status: "Available" },
    { id: 13, title: "Norwegian Wood", authorId: 13, genre: "Contemporary", status: "Checked Out" },
    { id: 14, title: "The House of the Spirits", authorId: 14, genre: "Magical Realism", status: "Available" },
    { id: 15, title: "One Hundred Years of Solitude", authorId: 15, genre: "Magical Realism", status: "Checked Out" },
    { id: 16, title: "Beloved", authorId: 16, genre: "Historical Fiction", status: "Available" },
    { id: 17, title: "American Gods", authorId: 17, genre: "Fantasy", status: "Available" },
    { id: 18, title: "The Handmaid's Tale", authorId: 18, genre: "Dystopian", status: "Checked Out" },
    { id: 19, title: "Along Came a Spider", authorId: 19, genre: "Mystery", status: "Available" },
    { id: 20, title: "Rebecca", authorId: 20, genre: "Gothic", status: "Checked Out" }
];

const patrons = [
    { id: 1, firstName: "Emma", lastName: "Watson", email: "emma.w@example.com", membershipDate: "2021-05-10" },
    { id: 2, firstName: "Liam", lastName: "Smith", email: "liam.s@example.com", membershipDate: "2020-03-15" },
    { id: 3, firstName: "Olivia", lastName: "Johnson", email: "olivia.j@example.com", membershipDate: "2022-01-20" },
    { id: 4, firstName: "Noah", lastName: "Brown", email: "noah.b@example.com", membershipDate: "2021-09-10" },
    { id: 5, firstName: "Sophia", lastName: "Miller", email: "sophia.m@example.com", membershipDate: "2020-06-05" },
    { id: 6, firstName: "Aiden", lastName: "Davis", email: "aiden.d@example.com", membershipDate: "2021-03-08" },
    { id: 7, firstName: "Isabella", lastName: "Garcia", email: "isabella.g@example.com", membershipDate: "2020-11-12" },
    { id: 8, firstName: "Lucas", lastName: "Martinez", email: "lucas.m@example.com", membershipDate: "2022-04-15" },
    { id: 9, firstName: "Mia", lastName: "Anderson", email: "mia.a@example.com", membershipDate: "2021-10-10" },
    { id: 10, firstName: "Ethan", lastName: "Martinez", email: "ethan.m@example.com", membershipDate: "2021-01-25" },
    { id: 11, firstName: "Charlotte", lastName: "Thomas", email: "charlotte.t@example.com", membershipDate: "2022-05-20" },
    { id: 12, firstName: "Amelia", lastName: "Moore", email: "amelia.m@example.com", membershipDate: "2020-08-18" },
    { id: 13, firstName: "James", lastName: "White", email: "james.w@example.com", membershipDate: "2019-12-05" },
    { id: 14, firstName: "Harper", lastName: "Clark", email: "harper.c@example.com", membershipDate: "2020-07-23" },
    { id: 15, firstName: "Benjamin", lastName: "Young", email: "benjamin.y@example.com", membershipDate: "2021-09-15" },
    { id: 16, firstName: "Elijah", lastName: "King", email: "elijah.k@example.com", membershipDate: "2021-11-20" },
    { id: 17, firstName: "Emily", lastName: "Wright", email: "emily.w@example.com", membershipDate: "2021-02-12" },
    { id: 18, firstName: "Oliver", lastName: "Green", email: "oliver.g@example.com", membershipDate: "2020-10-08" },
    { id: 19, firstName: "Luna", lastName: "Adams", email: "luna.a@example.com", membershipDate: "2020-09-15" },
    { id: 20, firstName: "Ella", lastName: "Nelson", email: "ella.n@example.com", membershipDate: "2021-12-25" }
];

const transactions = [
    { id: 1, bookId: 2, patronId: 1, dueDate: "2024-12-01", dateOut: "2024-11-20", returnDate: null },
    { id: 2, bookId: 5, patronId: 2, dueDate: "2024-11-28", dateOut: "2024-11-10", returnDate: null },
    { id: 3, bookId: 15, patronId: 3, dueDate: "2024-11-25", dateOut: "2024-11-12", returnDate: null },
    { id: 4, bookId: 18, patronId: 4, dueDate: "2024-11-30", dateOut: "2024-11-15", returnDate: "2024-11-28" },
    { id: 5, bookId: 20, patronId: 5, dueDate: "2024-11-27", dateOut: "2024-11-11", returnDate: null }
];

const fines = [
    { id: 1, patronId: 1, transactionId: 1, amount: 10.00, datePaid: null },
    { id: 2, patronId: 2, transactionId: 2, amount: 5.00, datePaid: null },
    { id: 3, patronId: 3, transactionId: 3, amount: 15.00, datePaid: null }
];


// Fetch and display demo content
function showDemo(viewName) {
    const demoContent = document.getElementById('demo-content');
    demoContent.innerHTML = `Fetching data for <strong>${viewName}</strong>...`;

    setTimeout(() => {
        if (viewName === "AvailableBooks") displayAvailableBooks();
        else if (viewName === "OverdueTransactions") displayOverdueTransactions();
        else if (viewName === "TotalFines") displayTotalFines();
        else if (viewName === "GenreBorrowingTrends") displayGenreBorrowingTrends();
    }, 1500);
}

// Display Available Books
function displayAvailableBooks() {
    const demoContent = document.getElementById("demo-content");
    const availableBooks = books.filter(book => book.status === "Available");

    demoContent.innerHTML = `
        <h3>Available Books</h3>
        ${availableBooks
            .map(book => {
                const author = authors.find(author => author.id === book.authorId);
                return `<p>${book.title} by ${author.firstName} ${author.lastName} (${book.genre})</p>`;
            })
            .join("")}
    `;
}

// Display Overdue Transactions
function displayOverdueTransactions() {
    const demoContent = document.getElementById("demo-content");
    const overdueTransactions = transactions.filter(
        transaction => new Date(transaction.dueDate) < new Date() && !transaction.returnDate
    );

    demoContent.innerHTML = `
        <h3>Overdue Transactions</h3>
        ${overdueTransactions
            .map(transaction => {
                const book = books.find(book => book.id === transaction.bookId);
                const patron = patrons.find(patron => patron.id === transaction.patronId);
                return `<p>${book.title} borrowed by ${patron.firstName} ${patron.lastName}, due on ${transaction.dueDate}</p>`;
            })
            .join("")}
    `;
}

// Display Total Fines
function displayTotalFines() {
    const demoContent = document.getElementById("demo-content");
    const finesSummary = patrons.map(patron => {
        const patronFines = fines.filter(fine => fine.patronId === patron.id && !fine.datePaid);
        const totalFines = patronFines.reduce((sum, fine) => sum + fine.amount, 0);
        return { patron, totalFines };
    }).filter(summary => summary.totalFines > 0);

    demoContent.innerHTML = `
        <h3>Total Fines Owed</h3>
        ${finesSummary
            .map(summary => `<p>${summary.patron.firstName} ${summary.patron.lastName}: $${summary.totalFines.toFixed(2)}</p>`)
            .join("")}
    `;
}

// Genre Borrowing Trends
function displayGenreBorrowingTrends() {
    const demoContent = document.getElementById("demo-content");

    const genreTrends = books.reduce((acc, book) => {
        const borrowCount = transactions.filter(transaction => transaction.bookId === book.id).length;
        if (borrowCount > 0) {
            acc[book.genre] = (acc[book.genre] || 0) + borrowCount;
        }
        return acc;
    }, {});

    demoContent.innerHTML = `
        <h3>Genre Borrowing Trends</h3>
        <ul>
            ${Object.entries(genreTrends)
                .map(([genre, count]) => `<li>${genre}: ${count} borrowings</li>`)
                .join("")}
        </ul>
    `;
}
