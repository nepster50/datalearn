CREATE TABLE customer_dim
(
 customer_id_dim serial NOT NULL,
 customer_name   varchar(30) NOT NULL,
 segment         varchar(30) NOT NULL,
 customer_id     varchar(30) NOT NULL,
 CONSTRAINT PK_82 PRIMARY KEY ( customer_id_dim )
);


CREATE TABLE geography_dim
(
 geography_id serial NOT NULL,
 country      varchar(30) NOT NULL,
 city         varchar(30) NOT NULL,
 "state"        varchar(30) NOT NULL,
 postal_code  integer NOT NULL,
 CONSTRAINT PK_74 PRIMARY KEY ( geography_id )
);

CREATE TABLE order_date_dim
(
 order_date_id_dim serial NOT NULL,
 order_date        date NOT NULL,
 year              integer NOT NULL,
 quarter           integer NOT NULL,
 week              integer NOT NULL,
 day               integer NOT NULL,
 CONSTRAINT PK_37 PRIMARY KEY ( order_date_id_dim )
);

CREATE TABLE product_dim
(
 product_id_dim serial NOT NULL,
 category       varchar(20) NOT NULL,
 sub_category   varchar(30) NOT NULL,
 product_name   varchar(130) NOT NULL,
 product_id     varchar(20) NOT NULL,
 CONSTRAINT PK_48 PRIMARY KEY ( product_id_dim )
);

CREATE TABLE sales_fact
(
 row_id            serial NOT NULL,
 sales             numeric(5,4) NOT NULL,
 quantity          integer NOT NULL,
 discount          numeric(2,2) NOT NULL,
 profit            numeric(21,16) NOT NULL,
 returned          varchar(50) NOT NULL,
 order_date_id_dim serial NOT NULL,
 product_id_dim    serial NOT NULL,
 ship_id_dim       serial NOT NULL,
 ship_date_id      serial NOT NULL,
 geography_id      serial NOT NULL,
 customer_id_dim   serial NOT NULL,
 order_id          varchar(50) NOT NULL,
 CONSTRAINT PK_24 PRIMARY KEY ( row_id ),
 CONSTRAINT FK_10 FOREIGN KEY ( order_date_id_dim ) REFERENCES order_date_dim ( order_date_id_dim ),
 CONSTRAINT FK_12 FOREIGN KEY ( product_id_dim ) REFERENCES product_dim ( product_id_dim ),
 CONSTRAINT FK_14 FOREIGN KEY ( ship_id_dim ) REFERENCES shipping_dim ( ship_id_dim ),
 CONSTRAINT FK_18 FOREIGN KEY ( ship_date_id ) REFERENCES ship_date_dim ( ship_date_id ),
 CONSTRAINT FK_20 FOREIGN KEY ( geography_id ) REFERENCES geography_dim ( geography_id ),
 CONSTRAINT FK_22 FOREIGN KEY ( customer_id_dim ) REFERENCES customer_dim ( customer_id_dim )
);

CREATE INDEX FK_38 ON sales_fact
(
 order_date_id_dim
);

CREATE INDEX FK_49 ON sales_fact
(
 product_id_dim
);

CREATE INDEX FK_57 ON sales_fact
(
 ship_id_dim
);

CREATE INDEX FK_63 ON sales_fact
(
 ship_date_id
);

CREATE INDEX FK_75 ON sales_fact
(
 geography_id
);

CREATE INDEX FK_83 ON sales_fact
(
 customer_id_dim
);

CREATE TABLE ship_date_dim
(
 ship_date_id serial NOT NULL,
 ship_date    date NOT NULL,
 year         integer NOT NULL,
 quarter      integer NOT NULL,
 month        integer NOT NULL,
 week         integer NOT NULL,
 day          integer NOT NULL,
 CONSTRAINT PK_62 PRIMARY KEY ( ship_date_id )
);


CREATE TABLE shipping_dim
(
 ship_id_dim serial NOT NULL,
 ship_mode   varchar(50) NOT NULL,
 CONSTRAINT PK_56 PRIMARY KEY ( ship_id_dim )
);