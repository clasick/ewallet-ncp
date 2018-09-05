create table USER_ACCOUNT
(
USER_ID INT not null auto_increment primary key,
USER_NAME VARCHAR(30) not null,
FIRST_NAME VARCHAR(15) not null,
LAST_NAME VARCHAR(15),
PASSWORD  VARCHAR(30) not null,
EMAIL VARCHAR(256) not null,
PHONE_NO VARCHAR(10) not null,
BALANCE INTEGER DEFAULT 0
);

create table CREDIT_CARD 
(
CARD_ID INT not null auto_increment primary key,
USER_ID INT not null,
OWNER VARCHAR(30) not null,
CARD_NUMBER VARCHAR(16) not null,
EXPIRY_MONTH VARCHAR(2) not null,
EXPIRY_YEAR VARCHAR(2) not null,
foreign key (user_id) references USER_ACCOUNT(user_id)
ON DELETE CASCADE
);