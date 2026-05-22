-- Kerri Kuhnke

-- Task 1:
-- Step 1: Add PRICE and DESCRIPTION columns to PRODUCTLIST
ALTER TABLE PRODUCTLIST
ADD PRICE NUMBER(7,2);

ALTER TABLE PRODUCTLIST
ADD DESCRIPTION VARCHAR2(255);

-- Step 2: Move PRICE data from STOREFRONT to PRODUCTLIST
UPDATE PRODUCTLIST P
SET PRICE = (
    SELECT S.PRICE
    FROM STOREFRONT S
    WHERE S.PRODUCTCODE = P.PRODUCTCODE
);

-- Step 3: Move DESCRIPTION data from STOREFRONT to PRODUCTLIST
UPDATE PRODUCTLIST P
SET DESCRIPTION = (
    SELECT S.DESCRIPTION
    FROM STOREFRONT S
    WHERE S.PRODUCTCODE = P.PRODUCTCODE
);

COMMIT;

-- Step 4: Drop the STOREFRONT table
DROP TABLE STOREFRONT;

-- Task 2:
-- Create the CHATLOG table
CREATE TABLE CHATLOG (
    CHATID      NUMBER(3),
    RECEIVERID  NUMBER(3),
    SENDERID    NUMBER(3),
    DATESENT    DATE,
    CONTENT     VARCHAR2(250),

    CONSTRAINT CHATLOG_PK
    PRIMARY KEY (CHATID),

    CONSTRAINT CHATLOG_RECEIVER_FK
    FOREIGN KEY (RECEIVERID)
    REFERENCES USERBASE (USERID),

    CONSTRAINT CHATLOG_SENDER_FK
    FOREIGN KEY (SENDERID)
    REFERENCES USERBASE (USERID)
);

-- Insert sample chat data
INSERT INTO CHATLOG
VALUES (1, 101, 102, TO_DATE('01-MAY-2026', 'DD-MON-YYYY'),
'Want to play tonight?');

INSERT INTO CHATLOG
VALUES (2, 102, 101, TO_DATE('01-MAY-2026', 'DD-MON-YYYY'),
'Sure, I will be online at 8.');

INSERT INTO CHATLOG
VALUES (3, 103, 104, TO_DATE('02-MAY-2026', 'DD-MON-YYYY'),
'Did you finish the quest?');

INSERT INTO CHATLOG
VALUES (4, 104, 103, TO_DATE('02-MAY-2026', 'DD-MON-YYYY'),
'Almost finished.');

INSERT INTO CHATLOG
VALUES (5, 105, 101, TO_DATE('03-MAY-2026', 'DD-MON-YYYY'),
'Can you help me level up?');

INSERT INTO CHATLOG
VALUES (6, 101, 105, TO_DATE('03-MAY-2026', 'DD-MON-YYYY'),
'Yes, let us play later.');

INSERT INTO CHATLOG
VALUES (7, 106, 102, TO_DATE('04-MAY-2026', 'DD-MON-YYYY'),
'The new update is awesome.');

INSERT INTO CHATLOG
VALUES (8, 102, 106, TO_DATE('04-MAY-2026', 'DD-MON-YYYY'),
'I agree, the graphics look great.');

INSERT INTO CHATLOG
VALUES (9, 107, 108, TO_DATE('05-MAY-2026', 'DD-MON-YYYY'),
'Want to trade items?');

INSERT INTO CHATLOG
VALUES (10, 108, 107, TO_DATE('05-MAY-2026', 'DD-MON-YYYY'),
'Yes, meet in the marketplace.');

COMMIT;

-- Test the table
SELECT *
FROM CHATLOG;

-- Task 3: 
-- Create the FRIENDSLIST table
CREATE TABLE FRIENDSLIST (
    USERID    NUMBER(3),
    FRIENDID  NUMBER(3),

    CONSTRAINT FRIENDSLIST_PK
    PRIMARY KEY (USERID, FRIENDID),

    CONSTRAINT FRIENDSLIST_USER_FK
    FOREIGN KEY (USERID)
    REFERENCES USERBASE (USERID),

    CONSTRAINT FRIENDSLIST_FRIEND_FK
    FOREIGN KEY (FRIENDID)
    REFERENCES USERBASE (USERID)
);

-- Insert sample friends list data
INSERT INTO FRIENDSLIST VALUES (101, 102);
INSERT INTO FRIENDSLIST VALUES (101, 103);
INSERT INTO FRIENDSLIST VALUES (102, 104);
INSERT INTO FRIENDSLIST VALUES (103, 105);
INSERT INTO FRIENDSLIST VALUES (104, 101);
INSERT INTO FRIENDSLIST VALUES (105, 106);
INSERT INTO FRIENDSLIST VALUES (106, 107);
INSERT INTO FRIENDSLIST VALUES (107, 108);
INSERT INTO FRIENDSLIST VALUES (108, 101);
INSERT INTO FRIENDSLIST VALUES (102, 105);
INSERT INTO FRIENDSLIST VALUES (103, 106);
INSERT INTO FRIENDSLIST VALUES (104, 107);

COMMIT;

-- Test the FRIENDSLIST table
SELECT *
FROM FRIENDSLIST;

-- Task 4:
-- Create the WISHLIST table
CREATE TABLE WISHLIST (
    USERID       NUMBER(3),
    PRODUCTCODE  VARCHAR2(5),
    POSITION     NUMBER(3),

    CONSTRAINT WISHLIST_PK
    PRIMARY KEY (USERID, PRODUCTCODE),

    CONSTRAINT WISHLIST_USER_FK
    FOREIGN KEY (USERID)
    REFERENCES USERBASE (USERID),

    CONSTRAINT WISHLIST_PRODUCT_FK
    FOREIGN KEY (PRODUCTCODE)
    REFERENCES PRODUCTLIST (PRODUCTCODE)
);

-- Insert sample wishlist data
INSERT INTO WISHLIST VALUES (101, 'GAME1', 1);
INSERT INTO WISHLIST VALUES (101, 'GAME2', 2);
INSERT INTO WISHLIST VALUES (102, 'GAME3', 1);
INSERT INTO WISHLIST VALUES (103, 'GAME4', 1);
INSERT INTO WISHLIST VALUES (104, 'GAME5', 3);
INSERT INTO WISHLIST VALUES (105, 'GAME6', 2);
INSERT INTO WISHLIST VALUES (106, 'GAME7', 1);
INSERT INTO WISHLIST VALUES (107, 'GAME8', 4);
INSERT INTO WISHLIST VALUES (108, 'GAME9', 2);
INSERT INTO WISHLIST VALUES (102, 'GME12', 3);
INSERT INTO WISHLIST VALUES (103, 'GME13', 2);
INSERT INTO WISHLIST VALUES (104, 'RPG10', 1);

COMMIT;

-- Test the WISHLIST table
SELECT *
FROM WISHLIST
ORDER BY USERID, POSITION;

-- Task 5:
-- Create the USERPROFILE table
CREATE TABLE USERPROFILE (
    USERID      NUMBER(3),
    IMAGEFILE   VARCHAR2(250),
    DESCRIPTION VARCHAR2(250),

    CONSTRAINT USERPROFILE_PK
    PRIMARY KEY (USERID),

    CONSTRAINT USERPROFILE_USER_FK
    FOREIGN KEY (USERID)
    REFERENCES USERBASE (USERID)
);

-- Insert sample profile data
INSERT INTO USERPROFILE
VALUES (101, 'images/user101.png',
'Competitive RPG player and achievement hunter.');

INSERT INTO USERPROFILE
VALUES (102, 'images/user102.png',
'Enjoys strategy games and online co-op.');

INSERT INTO USERPROFILE
VALUES (103, 'images/user103.png',
'Casual gamer who loves simulation games.');

INSERT INTO USERPROFILE
VALUES (104, 'images/user104.png',
'FPS fan and tournament participant.');

INSERT INTO USERPROFILE
VALUES (105, 'images/user105.png',
'Streamer and retro gaming enthusiast.');

INSERT INTO USERPROFILE
VALUES (106, 'images/user106.png',
'Collects rare in-game items.');

INSERT INTO USERPROFILE
VALUES (107, 'images/user107.png',
'Focuses on speedrunning and challenges.');

INSERT INTO USERPROFILE
VALUES (108, 'images/user108.png',
'Open world exploration gamer.');

INSERT INTO USERPROFILE
VALUES (109, 'images/user109.png',
'Plays multiplayer survival games.');

INSERT INTO USERPROFILE
VALUES (110, 'images/user110.png',
'Competitive esports player.');

COMMIT;

-- Test the USERPROFILE table
SELECT *
FROM USERPROFILE;

-- Task 6:
-- Create the SECURITYQUESTION table
CREATE TABLE SECURITYQUESTION (
    QUESTIONID NUMBER,
    USERID     NUMBER(3),
    QUESTION   VARCHAR2(250),
    ANSWER     VARCHAR2(250),

    CONSTRAINT SECURITYQUESTION_PK
    PRIMARY KEY (QUESTIONID),

    CONSTRAINT SECURITYQUESTION_USER_FK
    FOREIGN KEY (USERID)
    REFERENCES USERBASE (USERID)
);

-- Insert sample security question data
INSERT INTO SECURITYQUESTION
VALUES (1, 101,
'What was the name of your first pet?',
'Buddy');

INSERT INTO SECURITYQUESTION
VALUES (2, 102,
'What city were you born in?',
'Chicago');

INSERT INTO SECURITYQUESTION
VALUES (3, 103,
'What was your first school?',
'Lincoln Elementary');

INSERT INTO SECURITYQUESTION
VALUES (4, 104,
'What is your favorite game?',
'Galaxy Raiders');

INSERT INTO SECURITYQUESTION
VALUES (5, 105,
'What was your childhood nickname?',
'Jay');

INSERT INTO SECURITYQUESTION
VALUES (6, 106,
'What is your favorite food?',
'Pizza');

INSERT INTO SECURITYQUESTION
VALUES (7, 107,
'What was the make of your first car?',
'Toyota');

INSERT INTO SECURITYQUESTION
VALUES (8, 108,
'What is your favorite movie?',
'Inception');

INSERT INTO SECURITYQUESTION
VALUES (9, 109,
'What street did you grow up on?',
'Maple Street');

INSERT INTO SECURITYQUESTION
VALUES (10, 110,
'What is your favorite sport?',
'Soccer');

COMMIT;

-- Test the SECURITYQUESTION table
SELECT *
FROM SECURITYQUESTION;

-- Task 7:
-- Create the COMMUNITYRULES table
CREATE TABLE COMMUNITYRULES (
    RULENUM        NUMBER(3),
    TITLE          VARCHAR2(250),
    DESCRIPTION    VARCHAR2(250),
    SEVERITYPOINT  NUMBER(4),

    CONSTRAINT COMMUNITYRULES_PK
    PRIMARY KEY (RULENUM)
);

-- Insert sample community rules data
INSERT INTO COMMUNITYRULES
VALUES (1,
'No Harassment',
'Users may not harass or bully other players.',
100);

INSERT INTO COMMUNITYRULES
VALUES (2,
'No Cheating',
'The use of hacks or exploits is prohibited.',
250);

INSERT INTO COMMUNITYRULES
VALUES (3,
'Respectful Language',
'Offensive or hateful language is not allowed.',
150);

INSERT INTO COMMUNITYRULES
VALUES (4,
'No Spam',
'Repetitive or spam messages are prohibited.',
75);

INSERT INTO COMMUNITYRULES
VALUES (5,
'Protect Personal Information',
'Users should not share personal information publicly.',
200);

INSERT INTO COMMUNITYRULES
VALUES (6,
'No Impersonation',
'Pretending to be another user or staff member is prohibited.',
175);

INSERT INTO COMMUNITYRULES
VALUES (7,
'Appropriate Usernames',
'Usernames must remain appropriate and non-offensive.',
90);

INSERT INTO COMMUNITYRULES
VALUES (8,
'No Fraudulent Purchases',
'Fraudulent payment activity is prohibited.',
300);

INSERT INTO COMMUNITYRULES
VALUES (9,
'Respect Matchmaking',
'Users should not intentionally sabotage matches.',
125);

INSERT INTO COMMUNITYRULES
VALUES (10,
'Report Violations',
'Users should report rule violations responsibly.',
50);

COMMIT;

-- Test the COMMUNITYRULES table
SELECT *
FROM COMMUNITYRULES;

-- Task 8:
-- Create the INFRACTIONS table
CREATE TABLE INFRACTIONS (
    INFRACTIONID NUMBER,
    USERID       NUMBER(3),
    RULENUM      NUMBER(3),
    DATEASSIGNED DATE,
    PENALTY      VARCHAR2(250),

    CONSTRAINT INFRACTIONS_PK
    PRIMARY KEY (INFRACTIONID),

    CONSTRAINT INFRACTIONS_USER_FK
    FOREIGN KEY (USERID)
    REFERENCES USERBASE (USERID),

    CONSTRAINT INFRACTIONS_RULE_FK
    FOREIGN KEY (RULENUM)
    REFERENCES COMMUNITYRULES (RULENUM)
);

-- Insert sample infractions data
INSERT INTO INFRACTIONS
VALUES (1, 101, 1,
TO_DATE('01-MAY-2026', 'DD-MON-YYYY'),
'Warning issued');

INSERT INTO INFRACTIONS
VALUES (2, 102, 2,
TO_DATE('02-MAY-2026', 'DD-MON-YYYY'),
'7 day suspension');

INSERT INTO INFRACTIONS
VALUES (3, 103, 4,
TO_DATE('03-MAY-2026', 'DD-MON-YYYY'),
'Chat mute for 24 hours');

INSERT INTO INFRACTIONS
VALUES (4, 104, 3,
TO_DATE('04-MAY-2026', 'DD-MON-YYYY'),
'Formal warning');

INSERT INTO INFRACTIONS
VALUES (5, 105, 8,
TO_DATE('05-MAY-2026', 'DD-MON-YYYY'),
'Account locked pending review');

INSERT INTO INFRACTIONS
VALUES (6, 106, 5,
TO_DATE('06-MAY-2026', 'DD-MON-YYYY'),
'Privacy violation warning');

INSERT INTO INFRACTIONS
VALUES (7, 107, 6,
TO_DATE('07-MAY-2026', 'DD-MON-YYYY'),
'3 day suspension');

INSERT INTO INFRACTIONS
VALUES (8, 108, 7,
TO_DATE('08-MAY-2026', 'DD-MON-YYYY'),
'Username reset required');

INSERT INTO INFRACTIONS
VALUES (9, 109, 9,
TO_DATE('09-MAY-2026', 'DD-MON-YYYY'),
'Ranked matchmaking restriction');

INSERT INTO INFRACTIONS
VALUES (10, 110, 2,
TO_DATE('10-MAY-2026', 'DD-MON-YYYY'),
'Permanent account ban');

COMMIT;

-- Test the INFRACTIONS table
SELECT *
FROM INFRACTIONS;

-- Task 9:
-- Create the USERSUPPORT table
CREATE TABLE USERSUPPORT (
    TICKETID       NUMBER,
    EMAIL          VARCHAR2(250),
    ISSUE          VARCHAR2(250),
    DATESUBMITTED  DATE,
    DATEUPDATED    DATE,
    STATUS         VARCHAR2(250),

    CONSTRAINT USERSUPPORT_PK
    PRIMARY KEY (TICKETID)
);

-- Insert sample support ticket data
INSERT INTO USERSUPPORT
VALUES (1,
'user101@email.com',
'Unable to reset password',
TO_DATE('01-MAY-2026', 'DD-MON-YYYY'),
TO_DATE('01-MAY-2026', 'DD-MON-YYYY'),
'NEW');

INSERT INTO USERSUPPORT
VALUES (2,
'user102@email.com',
'Game purchase not appearing in library',
TO_DATE('02-MAY-2026', 'DD-MON-YYYY'),
TO_DATE('03-MAY-2026', 'DD-MON-YYYY'),
'IN PROGRESS');

INSERT INTO USERSUPPORT
VALUES (3,
'user103@email.com',
'Profile picture upload issue',
TO_DATE('03-MAY-2026', 'DD-MON-YYYY'),
TO_DATE('04-MAY-2026', 'DD-MON-YYYY'),
'CLOSED');

INSERT INTO USERSUPPORT
VALUES (4,
'user104@email.com',
'Wallet funds not updating',
TO_DATE('04-MAY-2026', 'DD-MON-YYYY'),
TO_DATE('05-MAY-2026', 'DD-MON-YYYY'),
'IN PROGRESS');

INSERT INTO USERSUPPORT
VALUES (5,
'user105@email.com',
'Cannot join multiplayer session',
TO_DATE('05-MAY-2026', 'DD-MON-YYYY'),
TO_DATE('05-MAY-2026', 'DD-MON-YYYY'),
'NEW');

INSERT INTO USERSUPPORT
VALUES (6,
'user106@email.com',
'Incorrect ban applied to account',
TO_DATE('06-MAY-2026', 'DD-MON-YYYY'),
TO_DATE('07-MAY-2026', 'DD-MON-YYYY'),
'IN PROGRESS');

INSERT INTO USERSUPPORT
VALUES (7,
'user107@email.com',
'Friend request system not working',
TO_DATE('07-MAY-2026', 'DD-MON-YYYY'),
TO_DATE('08-MAY-2026', 'DD-MON-YYYY'),
'CLOSED');

INSERT INTO USERSUPPORT
VALUES (8,
'user108@email.com',
'Game crashes during startup',
TO_DATE('08-MAY-2026', 'DD-MON-YYYY'),
TO_DATE('09-MAY-2026', 'DD-MON-YYYY'),
'IN PROGRESS');

INSERT INTO USERSUPPORT
VALUES (9,
'user109@email.com',
'Unable to redeem game code',
TO_DATE('09-MAY-2026', 'DD-MON-YYYY'),
TO_DATE('09-MAY-2026', 'DD-MON-YYYY'),
'NEW');

INSERT INTO USERSUPPORT
VALUES (10,
'user110@email.com',
'Issue with wishlist ordering',
TO_DATE('10-MAY-2026', 'DD-MON-YYYY'),
TO_DATE('11-MAY-2026', 'DD-MON-YYYY'),
'CLOSED');

COMMIT;

-- Test the USERSUPPORT table
SELECT *
FROM USERSUPPORT;

-- Task 10:
-- Create a view displaying every unique security question
CREATE VIEW SECURITYQUESTION_VIEW AS
SELECT DISTINCT QUESTION
FROM SECURITYQUESTION;

-- Test the SECURITYQUESTION_VIEW
SELECT *
FROM SECURITYQUESTION_VIEW;

-- Create a view displaying active support tickets
CREATE VIEW ACTIVE_SUPPORT_TICKETS_VIEW AS
SELECT TICKETID,
       EMAIL,
       ISSUE,
       DATEUPDATED
FROM USERSUPPORT
WHERE STATUS IN ('NEW', 'IN PROGRESS')
ORDER BY DATEUPDATED ASC;

-- Test the ACTIVE_SUPPORT_TICKETS_VIEW
SELECT *
FROM ACTIVE_SUPPORT_TICKETS_VIEW;