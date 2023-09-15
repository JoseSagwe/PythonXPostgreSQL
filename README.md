# PythonXPostgreSQL
# PostgreSQL Database Operations

## Overview

This project is a Python script for interacting with a PostgreSQL database. It establishes a connection to the database, creates tables, inserts test data, and performs various database operations using SQL queries. The script is organized into different sections, each of which represents a specific database operation.

## Prerequisites

Before running the script, make sure you have the following prerequisites:

- PostgreSQL installed on your local machine.
- A PostgreSQL database named 'food_store' (You can change the database name in the script if needed).
- Python 3 installed on your local machine.
- Python packages `psycopg2` installed. You can install it using `pip install psycopg2`.

## 1. Connection

### Description

This code cell establishes a connection to the PostgreSQL database and executes queries for creating tables and inserting test data into the database. It requires necessary connection parameters such as the host, database name, username, password, and port number.


## 2. Listing Tables

### Description

This code cell defines a function to list all the tables in the database. It executes a SQL query to fetch the table names from the database and displays them as the output.

### Code

```python
query_list_tables = """
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'public';
"""

tables = execute_query_fetch_all(query_list_tables)
print("Tables in the database:")
print(tables)
```

<a name="two"></a>
## 3. Listing Items in the Supplements Section

### Description

This code cell defines a function to list all the items in the supplements section.

### Code

```python
query_list_supplements = """
    SELECT item_name
    FROM items
    WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'supplements');
"""

supplements = execute_query_fetch_all(query_list_supplements)
print("\nItems in the supplements section:")
print(supplements)
```

<a name="three"></a>
## 4. Listing All Departments

### Description

This code cell defines a function to list all the departments in the health food store.

### Code

```python
query_list_departments = """
    SELECT department_name
    FROM departments;
"""

departments = execute_query_fetch_all(query_list_departments)
print("\nDepartments:")
print(departments)
```

<a name="four"></a>
## 5. Adding an Anonymous Shopping Trip

### Description

This code cell defines a function to add an anonymous shopping trip
