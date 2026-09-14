## 📊 Database Tables

### 👨‍💼 Employees

| Column | Type | Key |
|---|---|---|
| id | SERIAL | 🔑 PK |
| name | VARCHAR(50) | |
| age | INT | |
| gender | VARCHAR(10) | |
| department_id | INT | 🔗 FK |
| salary | INT | |
| manager_id | INT | 🔗 FK → employees.id |
| joining_date | DATE | |

---

### 🏢 Departments

| Column | Type | Key |
|---|---|---|
| id | SERIAL | 🔑 PK |
| department_name | VARCHAR(50) | |

---

### 📁 Projects

| Column | Type | Key |
|---|---|---|
| id | SERIAL | 🔑 PK |
| project_name | VARCHAR(100) | |
| department_id | INT | 🔗 FK |
| budget | INT | |

---

### 🔗 Employee Projects

| Column | Type | Key |
|---|---|---|
| employee_id | INT | 🔗 FK |
| project_id | INT | 🔗 FK |

---

### 🛒 Orders

| Column | Type | Key |
|---|---|---|
| id | SERIAL | 🔑 PK |
| employee_id | INT | 🔗 FK |
| amount | INT | |
| order_date | DATE | |
