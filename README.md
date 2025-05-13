# 🛠️ Spring MVC CRUD App with PostgreSQL

This is a basic **Spring MVC** CRUD (Create, Read, Update, Delete) web application that connects to a **PostgreSQL** database. It demonstrates how to create a user form, save data, retrieve it on a dashboard, and provide **edit** and **delete** functionalities using JSP views.

---

## 🧾 Features

- 📝 Add user data via form
- 📄 Display all users in a table format
- ✏️ Edit and update user details
- ❌ Delete user entries
- 🗃️ Connected to PostgreSQL using JDBC
- 📦 Clean MVC architecture using Spring Framework

---

## ⚙️ Tech Stack

- Java
- Spring MVC
- JSP
- JDBC
- PostgreSQL
- Maven
- Apache Tomcat

---

## 🗂️ Project Structure

```plaintext
SpringMVCcrud/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       ├── controllers/
│       │       │   └── UserController.java
│       │       ├── dao/
│       │       │   └── UserDao.java
│       │       ├── fetchData/
│       │       │   └── fetchUser.java
│       │       └── model/
│       │           └── User.java
│       ├── resources/
│       └── webapp/
│           ├── index.jsp
│           └── WEB-INF/
│               ├── views/
│               │   ├── form.jsp
│               │   ├── showUser.jsp
│               │   └── editForm.jsp
│               ├── spring-servlet.xml
│               └── web.xml
```
---

## 🧭 Application Flow

1. **Landing Page (`index.jsp`)**
   - Entry point of the application.

2. **Form Submission (`form.jsp`)**
   - User enters name, contact, age, and address.
   - Data is submitted to `UserController`.

3. **Controller (`UserController.java`)**
   - Receives and routes the request to appropriate services and JSPs.
   - Calls DAO methods for database interaction.

4. **DAO Layer (`UserDao.java`)**
   - Contains all JDBC logic to perform insert, update, delete, and fetch operations with PostgreSQL.

5. **Data Fetching (`fetchUser.java`)**
   - Separates fetching logic to return a list of all users.

6. **Model (`User.java`)**
   - POJO representing user entity.

7. **Show Data (`showUser.jsp`)**
   - Displays all users in a table.
   - Each row has **Edit** and **Delete** buttons.

8. **Edit (`editForm.jsp`)**
   - Loads user data into form for editing.

---

## ⚙️ Setup Instructions

### Prerequisites

- Java 8+
- PostgreSQL installed and running
- Apache Tomcat
- Maven
- Eclipse IDE (recommended)

### Database Setup

1. Create a PostgreSQL database named `springmvcdb` (or as used in your code).
2. Create a `users` table with:

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    pass VARCHAR(20),
    cpass VARCHAR(20),
    age INT,
    
);
```
3. Update your PostgreSQL credentials in UserDao.java.

### Running the App

1. Clone the repository.

```bash
git clone https://github.com/your-username/SpringMVCcrud.git
cd SpringMVCcrud
```
2. Import the project in Eclipse as a Maven Project.

3. Configure Apache Tomcat server in Eclipse.

4. Run the application on server.

5. Visit http://localhost:8080/SpringMVCcrud

---

## 📸 Screenshots
**form.jsp**
![image](https://github.com/user-attachments/assets/37186139-9ed6-4168-a89f-b676458c75e0)

**showuser.jsp**
![image](https://github.com/user-attachments/assets/271fa818-a55d-45db-8e1d-52fe4e8bc65d)

**editForm.jsp**
![image](https://github.com/user-attachments/assets/66b03c7f-3c1c-444f-98d7-f0f984ac3c9b)

**PostgreSQL**
![image](https://github.com/user-attachments/assets/19c4820c-94fc-46ab-ac52-200c9dc6ff04)


---

## 📄 License
This project is licensed under the MIT License.

## 🤝 Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

