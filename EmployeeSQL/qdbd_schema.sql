
CREATE TABLE "departments" (
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    "last_updated" timestamp   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    "last_updated" timestamp   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(10)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(5)   NOT NULL,
    "hire_date" date   NOT NULL,
    "last_update" timestamp   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);


CREATE TABLE "dept_emp" (
    "dept_emp_id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
    "last_update" timestamp   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "dept_emp_id"
     )
);

CREATE TABLE "dept_manager" (
    "dept_manager_id" serial   NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" int   NOT NULL,
    "last_update" timestamp   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_manager_id"
     )
);

CREATE TABLE "salaries" (
    "salary_id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "last_update" timestamp   NOT NULL
);


ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");