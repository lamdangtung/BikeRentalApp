CREATE TABLE parking (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    address VARCHAR(255),
    area double,
    num_single INT,
    num_couple INT,
    num_electric INT,
    -- empty_single INT,
    -- empty_couple INT,
    -- empty_electric INT,
    PRIMARY KEY (id)
);


CREATE TABLE bike (
    id INT NOT NULL AUTO_INCREMENT,
    category VARCHAR(45),
    barcode VARCHAR(45) NOT NULL,
    isRented TINYINT,
    licenseplate VARCHAR(45),
    deposite INT,
    rentalPrice INT,
    parkingId INT,
    battery INT,
    PRIMARY KEY (id,barcode),
    FOREIGN KEY (parkingId) REFERENCES parking(id)
);

-- CREATE TABLE rental_order(
--     id INT NOT NULL AUTO_INCREMENT,
--     createdRental DATETIME,
--     bikeId INT,
--     PRIMARY KEY (id),
--     FOREIGN KEY (bikeId) REFERENCES bike(id)
-- );

-- CREATE TABLE rental_invoice(
--     id INT NOT NULL AUTO_INCREMENT,
--     totalPrice INT,
--     orderId INT,
--     PRIMARY KEY (id),
--     FOREIGN KEY (orderId) REFERENCES rental_order(id)
-- );

-- CREATE TABLE rental_order(
--     id INT NOT NULL AUTO_INCREMENT,
--     createdRental DATETIME,
--     bikeId INT,
--     PRIMARY KEY (id),
--     FOREIGN KEY (bikeId) REFERENCES bike(id)
-- );

CREATE TABLE rental_invoice(
    id INT NOT NULL AUTO_INCREMENT,
    totalPrice INT,
    bikeId INT,
    createdAt DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (bikeId) REFERENCES bike(id)
);


CREATE TABLE payment_transaction(
    id VARCHAR(100) NOT NULL ,
    content VARCHAR(100),
    method VARCHAR(100),
    createdAt DATETIME,
    bikeId INT,
    invoiceId INT,
    PRIMARY KEY (id),
    FOREIGN KEY (invoiceId) REFERENCES rental_invoice(id)
);


INSERT INTO parking(name,address,area,num_single,num_couple,num_electric) 
VALUES ("Bãi xe Hai Bà Trưng", "35 Trần Đại Nghĩa, Hà Nội", 30.00,10,5,6);
INSERT INTO parking(name,address,area,num_single,num_couple,num_electric) 
VALUES ("Bãi xe Hoàng Mai", "100 Hoàng Liệt, Hà Nội", 146.69,100,50,13);

INSERT INTO bike(category,barcode,isRented,deposite,rentalPrice,licenseplate,parkingId) VALUES
("XE_DAP_DON", "EC0001",0,400,5,"XD1-01",1);
INSERT INTO bike(category,barcode,isRented,deposite,rentalPrice,licenseplate,parkingId) VALUES
("XE_DAP_DOI", "EC0002",0,550,10,"XD2-01",2);
INSERT INTO bike(category,barcode,isRented,deposite,rentalPrice,licenseplate,parkingId) VALUES
("XE_DAP_DON", "EC0003",0,400,5,"XD1-02",2);

INSERT INTO bike(category,barcode,isRented,deposite,rentalPrice,licenseplate,parkingId) VALUES
("XE_DAP_DON", "EC0004",0,400,5,"XD1-03",1);
INSERT INTO bike(category,barcode,isRented,deposite,rentalPrice,licenseplate,parkingId,battery) VALUES
("XE_DAP_DIEN", "EC0009",0,700,10,"XDD-01",1,60);



-- INSERT INTO bike(category,barcode,isRented,licenseplate,parkingId) VALUES
-- ("XE_DAP_DON", "EC0001",0,"XD1-01",1);
-- INSERT INTO single_bike(id,deposite,rentalPrice) VALUES
-- (1,400,3);
-- INSERT INTO bike(category,barcode,isRented,deposite,rentalPrice,licenseplate,parkingId) VALUES
-- ("XE_DAP_DOI", "EC0002",0,"XD2-01",2);
-- INSERT INTO couple_bike(id,deposite,rentalPrice) VALUES
-- (2,550,6);
-- INSERT INTO bike(category,barcode,isRented,licenseplate,parkingId) VALUES
-- ("XE_DAP_DIEN", "EC0003",0,"XDD-01",1); 
-- INSERT INTO electric_bike(id,deposite,rentalPrice,battery) VALUES
-- (3,700,6,60);