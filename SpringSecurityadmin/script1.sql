/*All User's gets stored in APP_USER table*/
create table APP_USER (
   id BIGINT NOT NULL AUTO_INCREMENT,
   sso_id VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   age int(2) NOT NULL,
   email VARCHAR(30) NOT NULL,
   date_inscription TIMESTAMP NOT NULL,
   country VARCHAR(30) NOT NULL,
   latitude double NOT NULL,
   longitude double NOT NULL,
   state VARCHAR(30) NOT NULL,  
   PRIMARY KEY (id),
   UNIQUE (sso_id)
);
  
/* USER_PROFILE table contains all possible roles */ 
create table USER_PROFILE(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);
  
/* JOIN TABLE for MANY-TO-MANY relationship*/  
CREATE TABLE APP_USER_USER_PROFILE (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILE (id)
);
 
/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILE(type)
VALUES ('USER');
 
INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');
 
INSERT INTO USER_PROFILE(type)
VALUES ('DBA');
 
 
/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO APP_USER(sso_id, password, first_name, last_name, age, email, date_inscription, country, latitude, longitude, state)
VALUES ('sam','sam', 'Abdoul','DIALLO', 29, 'abdoul@email.com', now(), 'FRANCE', 50.640266, 3.074592, 'Active');
 
 
/* Populate JOIN Table */
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT user.id, profile.id 
  FROM app_user user, user_profile profile
  where user.sso_id='sam' 
  and profile.type='ADMIN';