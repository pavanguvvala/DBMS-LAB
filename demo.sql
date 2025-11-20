create TABLE friends(S_NO NUMBER,Name VARCHAR2(10));

desc friends;

select * from FRIENDS;

INSERT into FRIENDS VALUES (054,'Chakri');
INSERT into FRIENDS VALUES (031,'Surendra');
INSERT into FRIENDS VALUES (084,'Rohit');

alter TABLE friends RENAME COLUMN S_NO to ROLL_NO;
