-- Passengers --
CREATE TABLE  "passengers" (
"id" INTEGER,
"first_name" TEXT NOT NULL,
"last_name" TEXT NOT NULL,
"age" INTEGER NOT NULL,
PRIMARY KEY ("id")
)
;


-- Check_Ins --
CREATE TABLE "checkins" (
"id" INTEGER,
"passenger_id" NOT NULL,
"flight_id" NOT NULL,
"date_time" DATETIME NOT NULL,
PRIMARY KEY ("id"),
FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id"),
FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);



-- Airlines --

CREATE TABLE "airlines" (
"id" INTEGER,
"name" TEXT NOT NULL,
"concourse" TEXT NOT NULL CHECK("concourse" IN ('A','B', 'C', 'D', 'E', 'F','T')),
PRIMARY KEY ("id")
);


-- Flights --

CREATE TABLE "flights" (
"id" INTEGER,
"flight_number" INTEGER NOT NULL,
"airline_id" INTEGER NOT NULL,
"from_airport" TEXT NOT NULL,
"to_airport" TEXT NOT NULL,
"departure_time" DATETIME not null,
"arrivial_time" DATETIME not null,
PRIMARY KEY ("id")
FOREIGN KEY ("airline_id") REFERENCES "airlines"("id")
);
