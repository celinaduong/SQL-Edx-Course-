CREATE TABLE "users" (
    "id" INTEGER NOT NULL,
"first_name" TEXT NOT NULL,
"last_name" TEXT NOT NULL,
"username" TEXT NOT NULL,
"password" TEXT NOT NULL
);

CREATE TABLE "education" (
    "id" INTEGER NOT NULL,
    "schoolname" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year_founded" INTEGER NOT NULL
);

CREATE TABLE "companies" (
    "id" INTEGER NOT NULL,
    "company_name" TEXT NOT NULL,
    "company_industry" TEXT NOT NULL,
    "location" TEXT NOT NULL
);



create table user_connections (
    id integer,
    user1_id integer not null,
    user2_id integer not null,
    primary key(id),
    foreign key(user1_id) references users(id),
    foreign key(user2_id) references users(id),
    check (user1_id != user2_id), -- Ensures that a user cannot be connected to themselves
    unique (user1_id, user2_id) -- Ensures that each connection is unique
);



CREATE TABLE "school_connection" (
    "id" INTEGER NOT NULL,
    user_id integer not null,
    school_id integer not null,
    "start_date" numeric not null,
    end_date numeric,
    degree text not null,
    primary key(id),
    foreign key(user_id) references users(id),
    foreign key(school_id) references schools(id)
);



create table company_connections (
    id integer not null,
    user_id integer not null,
    company_id integer not null,
    "start_date" numeric not null,
    end_date numeric,
    title text not null,
    primary key(id),
    foreign key(user_id) references users(id),
    foreign key(company_id) references companies(id)
);
