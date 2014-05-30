--------------------------------------------------------
--  File created - Friday-May-30-2014   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence DOCTOR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOSPITAL"."DOCTOR_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PATIENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOSPITAL"."PATIENT_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ACTIVITY_AUDIT
--------------------------------------------------------

  CREATE TABLE "HOSPITAL"."ACTIVITY_AUDIT" 
   (	"DATE_TIME" TIMESTAMP (6), 
	"ACTIVITY" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table APPOINTMENT
--------------------------------------------------------

  CREATE TABLE "HOSPITAL"."APPOINTMENT" 
   (	"ID" NUMBER, 
	"DATE_TIME" TIMESTAMP (6), 
	"REASON" VARCHAR2(150 BYTE), 
	"DOCTOR_ID" NUMBER, 
	"PATIENT_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DOCTOR
--------------------------------------------------------

  CREATE TABLE "HOSPITAL"."DOCTOR" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(20 BYTE), 
	"SURNAME" VARCHAR2(20 BYTE), 
	"IS_AVAILABLE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PATIENT
--------------------------------------------------------

  CREATE TABLE "HOSPITAL"."PATIENT" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(20 BYTE), 
	"SURNAME" VARCHAR2(20 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"CITY" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PAYMENT
--------------------------------------------------------

  CREATE TABLE "HOSPITAL"."PAYMENT" 
   (	"APPOINTMENT_ID" NUMBER, 
	"AMOUNT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HOSPITAL.ACTIVITY_AUDIT
REM INSERTING into HOSPITAL.APPOINTMENT
Insert into HOSPITAL.APPOINTMENT (ID,DATE_TIME,REASON,DOCTOR_ID,PATIENT_ID) values (1,to_timestamp('28-JUN-14 11.14.59.263000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'Eye Test',5,1);
Insert into HOSPITAL.APPOINTMENT (ID,DATE_TIME,REASON,DOCTOR_ID,PATIENT_ID) values (2,to_timestamp('29-JUN-14 11.15.30.167000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'Colonoscopy',4,2);
REM INSERTING into HOSPITAL.DOCTOR
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (4,'Clive ','Evertse',1);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (5,'Brandon','Lotriet',1);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (6,'Luthando','Dyasi',0);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (7,'Sandiso','Toto',1);
REM INSERTING into HOSPITAL.PATIENT
Insert into HOSPITAL.PATIENT (ID,NAME,SURNAME,ADDRESS,CITY) values (1,'Yandiswa','Makanda','5 Street address','Cape Town');
Insert into HOSPITAL.PATIENT (ID,NAME,SURNAME,ADDRESS,CITY) values (2,'Deen','Hans','9 Street Address','Cape Town');
Insert into HOSPITAL.PATIENT (ID,NAME,SURNAME,ADDRESS,CITY) values (3,'Dean','VanNiekerk','7 Street address, Plain','Cape Town');
REM INSERTING into HOSPITAL.PAYMENT
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (1,200);
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (1,200);
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (2,200);
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (1,200);
--------------------------------------------------------
--  DDL for Index PATIENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOSPITAL"."PATIENT_PK" ON "HOSPITAL"."PATIENT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DOCTOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOSPITAL"."DOCTOR_PK" ON "HOSPITAL"."DOCTOR" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOSPITAL"."TABLE1_PK" ON "HOSPITAL"."APPOINTMENT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table PATIENT
--------------------------------------------------------

  ALTER TABLE "HOSPITAL"."PATIENT" ADD CONSTRAINT "PATIENT_ID" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HOSPITAL"."PATIENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table APPOINTMENT
--------------------------------------------------------

  ALTER TABLE "HOSPITAL"."APPOINTMENT" ADD CONSTRAINT "APPOINTMENT_ID" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOCTOR
--------------------------------------------------------

  ALTER TABLE "HOSPITAL"."DOCTOR" ADD CONSTRAINT "DOCTOR_ID" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HOSPITAL"."DOCTOR" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table APPOINTMENT
--------------------------------------------------------

  ALTER TABLE "HOSPITAL"."APPOINTMENT" ADD CONSTRAINT "DOCTOR_FK" FOREIGN KEY ("DOCTOR_ID")
	  REFERENCES "HOSPITAL"."DOCTOR" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "HOSPITAL"."APPOINTMENT" ADD CONSTRAINT "PATIENT_FK" FOREIGN KEY ("PATIENT_ID")
	  REFERENCES "HOSPITAL"."PATIENT" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  DDL for Trigger DOCTOR_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOSPITAL"."DOCTOR_TRG" BEFORE INSERT ON DOCTOR 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT DOCTOR_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HOSPITAL"."DOCTOR_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PATIENT_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOSPITAL"."PATIENT_TRG" BEFORE INSERT ON PATIENT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT PATIENT_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HOSPITAL"."PATIENT_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PAY_FOR_APPOINTMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOSPITAL"."PAY_FOR_APPOINTMENT" 
BEFORE INSERT ON appointment
BEGIN
Insert into payment(appointment_id,amount) VALUES( 1, 200);

END;
/
ALTER TRIGGER "HOSPITAL"."PAY_FOR_APPOINTMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGGER1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOSPITAL"."TRIGGER1" 
AFTER INSERT ON APPOINTMENT 
BEGIN
  insert into payment values(1,200);
END;
/
ALTER TRIGGER "HOSPITAL"."TRIGGER1" ENABLE;
--------------------------------------------------------
--  DDL for Function GET_ALLITEMS
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "HOSPITAL"."GET_ALLITEMS" 
  RETURN SYS_REFCURSOR
AS
  my_cursor SYS_REFCURSOR;
BEGIN
  OPEN my_cursor FOR SELECT * FROM doctor;
  RETURN my_cursor;
END get_allitems;

/

--------------------------------------------------------
--  DDL for Package DOCTORS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HOSPITAL"."DOCTORS" AS

function get_doctor_appointments(p_doctor_id number) return sys_refcursor;
function get_doctor_monthly_earnings(p_doctor_id number) return NUMBER;
function get_available_doctors return sys_refcursor;

END;

/

--------------------------------------------------------
--  DDL for Package PATIENTS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HOSPITAL"."PATIENTS" AS

function get_patient_appointments(p_patient_id number) return sys_refcursor;
function get_patient_monthly_owing(p_patient_id number) return NUMBER;

END;

/

--------------------------------------------------------
--  DDL for Package Body DOCTORS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HOSPITAL"."DOCTORS" AS


function get_doctor_appointments(p_doctor_id number) return sys_refcursor AS
doctor_appointments sys_refcursor;
  BEGIN
  OPEN doctor_appointments FOR SELECT * FROM appointment a 
                               WHERE a.doctor_id = p_doctor_id ;
  
  return doctor_appointments;
END get_doctor_appointments;


function get_doctor_monthly_earnings(p_doctor_id number) return NUMBER AS
v_total_earnings NUMBER;
  BEGIN
  
  SELECT SUM(p.amount) INTO v_total_earnings FROM payment p
  INNER JOIN appointment a
  ON a.id = p.appointment_id
  WHERE a.doctor_id = p_doctor_id;
  
  return v_total_earnings;
END get_doctor_monthly_earnings;
  
  
  
function get_available_doctors return sys_refcursor AS
available_doctors sys_refcursor;
  BEGIN
  OPEN available_doctors FOR SELECT * FROM doctor WHERE is_available = 1;
  
  return available_doctors;
END get_available_doctors;

END doctors;

/

--------------------------------------------------------
--  DDL for Package Body PATIENTS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HOSPITAL"."PATIENTS" AS

function get_patient_appointments(p_patient_id number) return sys_refcursor AS
patient_appointments sys_refcursor;

BEGIN
  OPEN patient_appointments FOR SELECT * FROM appointment a WHERE a.patient_id = p_patient_id;
  return patient_appointments;
  
END get_patient_appointments;
 
function get_patient_monthly_owing(p_patient_id number) return NUMBER AS 
v_owing NUMBER;
BEGIN
SELECT SUM(p.amount) INTO v_owing FROM payment p
  INNER JOIN appointment a
  ON a.id = p.appointment_id
  WHERE a.patient_id = p_patient_id;
  
  return v_owing;
END get_patient_monthly_owing;

END;

/

