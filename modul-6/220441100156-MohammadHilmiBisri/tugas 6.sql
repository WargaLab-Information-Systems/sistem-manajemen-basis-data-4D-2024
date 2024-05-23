CREATE DATABASE OutsourcingCompany;

USE OutsourcingCompany;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
    start_date DATE,
    end_date DATE
);

CREATE TABLE certificates (
    certificate_id INT PRIMARY KEY,
    employee_id INT,
    certificate_name VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE trainings (
    training_id INT PRIMARY KEY,
    certificate_name VARCHAR(100),
    duration_in_months INT
);

CREATE TABLE notifications (
    notification_id INT PRIMARY KEY,
    employee_id INT,
    message TEXT,
    date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    address TEXT
);

INSERT INTO employees (employee_id, name, position, salary, date_hired, project_id) VALUES (1, 'John Doe', 'Manager', 5000, '2022-01-01', 1), (2, 'Jane Smith', 'Developer', 3000, '2022-02-15', 1), (3, 'Mike Johnson', 'Analyst', 4000, '2022-03-10', 2), (4, 'Emily Brown', 'Designer', 3500, '2022-04-20', 2), (5, 'David Wilson', 'Tester', 2500, '2022-05-05', 3), (6, 'Sarah Davis', 'Developer', 3000, '2022-06-15', 3), (7, 'Michael Lee', 'Manager', 5000, '2022-07-01', 4), (8, 'Jennifer Clark', 'Analyst', 4000, '2022-08-10', 4), (9, 'Christopher Taylor', 'Designer', 3500, '2022-09-20', 5), (10, 'Jessica Martinez', 'Tester', 2500, '2022-10-05', 5);
INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES (1, 'Project A', 'Company X', '2022-01-01', '2022-06-30'), (2, 'Project B', 'Company Y', '2022-02-15', '2022-07-31'), (3, 'Project C', 'Company Z', '2022-03-10', '2022-08-31'), (4, 'Project D', 'Company X', '2022-04-20', '2022-09-30'), (5, 'Project E', 'Company Y', '2022-05-05', '2022-10-31');
INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES (1, 1, 'Certificate A', '2022-01-01', '2023-01-01'), (2, 2, 'Certificate B', '2022-02-15', '2023-02-15'), (3, 3, 'Certificate C', '2022-03-10', '2023-03-10'), (4, 4, 'Certificate D', '2022-04-20', '2023-04-20'), (5, 5, 'Certificate E', '2022-05-05', '2023-05-05');
INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES (1, 'Training A', 3), (2, 'Training B', 6), (3, 'Training C', 9), (4, 'Training D', 12), (5, 'Training E', 15);
INSERT INTO notifications (notification_id, employee_id, message, date) VALUES (1, 1, 'Notification A', '2022-01-01'), (2, 2, 'Notification B', '2022-02-15'), (3, 3, 'Notification C', '2022-03-10'), (4, 4, 'Notification D', '2022-04-20'), (5, 5, 'Notification E', '2022-05-05');
INSERT INTO companies (company_id, company_name, address) VALUES (1, 'Company X', 'Address X'), (2, 'Company Y', 'Address Y'), (3, 'Company Z', 'Address Z');











