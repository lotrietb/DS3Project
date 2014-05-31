--------------------------------------------------------
--  File created - Saturday-May-31-2014   
--------------------------------------------------------
  DROP TABLE "HOSPITAL"."ACTIVITY_AUDIT" cascade constraints;
  DROP TABLE "HOSPITAL"."APPOINTMENT" cascade constraints;
  DROP TABLE "HOSPITAL"."DOCTOR" cascade constraints;
  DROP TABLE "HOSPITAL"."PATIENT" cascade constraints;
  DROP TABLE "HOSPITAL"."PAYMENT" cascade constraints;
  DROP SEQUENCE "HOSPITAL"."APPOINTMENT_SEQ";
  DROP SEQUENCE "HOSPITAL"."DOCTOR_SEQ";
  DROP SEQUENCE "HOSPITAL"."PATIENT_SEQ";
  DROP PACKAGE "HOSPITAL"."APPOINTMENTS";
  DROP PACKAGE "HOSPITAL"."DOCTORS";
  DROP PACKAGE "HOSPITAL"."PATIENTS";
  DROP PACKAGE BODY "HOSPITAL"."APPOINTMENTS";
  DROP PACKAGE BODY "HOSPITAL"."DOCTORS";
  DROP PACKAGE BODY "HOSPITAL"."PATIENTS";
--------------------------------------------------------
--  DDL for Sequence APPOINTMENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOSPITAL"."APPOINTMENT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 42 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DOCTOR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOSPITAL"."DOCTOR_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PATIENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOSPITAL"."PATIENT_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
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
	"CITY" VARCHAR2(20 BYTE), 
	"ID_NUMBER" VARCHAR2(13 BYTE)
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
Insert into HOSPITAL.APPOINTMENT (ID,DATE_TIME,REASON,DOCTOR_ID,PATIENT_ID) values (1,to_timestamp('31-MAY-14 02.30.54.793000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'Eye Test',5,1);
Insert into HOSPITAL.APPOINTMENT (ID,DATE_TIME,REASON,DOCTOR_ID,PATIENT_ID) values (2,to_timestamp('29-JUN-14 11.15.30.167000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'Colonoscopy',4,2);
Insert into HOSPITAL.APPOINTMENT (ID,DATE_TIME,REASON,DOCTOR_ID,PATIENT_ID) values (24,to_timestamp('31-MAY-14 03.36.21.460000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'Monthly checkup.',4,2);
Insert into HOSPITAL.APPOINTMENT (ID,DATE_TIME,REASON,DOCTOR_ID,PATIENT_ID) values (25,to_timestamp('31-MAY-14 03.37.18.007000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'Monthly checkup.',4,2);
Insert into HOSPITAL.APPOINTMENT (ID,DATE_TIME,REASON,DOCTOR_ID,PATIENT_ID) values (28,to_timestamp('31-MAY-14 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'sjfndsf',5,22);
Insert into HOSPITAL.APPOINTMENT (ID,DATE_TIME,REASON,DOCTOR_ID,PATIENT_ID) values (29,to_timestamp('24-SEP-14 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'Tired of thinking, my head hurts',7,3);
REM INSERTING into HOSPITAL.DOCTOR
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (4,'Clive ','Evertse',1);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (5,'Brandon','Lotriet',1);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (6,'Luthando','Dyasi',0);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (7,'Sandiso','Toto',1);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (21,'Natasha','Kwonglee',null);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (22,'Natasha','Kwonglee',null);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (23,'Natasha','Kwonglee',1);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (24,'Johannes','Burger',1);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (25,null,null,1);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (26,'Johannes','Burger',1);
Insert into HOSPITAL.DOCTOR (ID,NAME,SURNAME,IS_AVAILABLE) values (27,'Johannes','Birger',1);
REM INSERTING into HOSPITAL.PATIENT
Insert into HOSPITAL.PATIENT (ID,NAME,SURNAME,ADDRESS,CITY,ID_NUMBER) values (1,'Yandiswa','Makanda','5 Street address','Cape Town',null);
Insert into HOSPITAL.PATIENT (ID,NAME,SURNAME,ADDRESS,CITY,ID_NUMBER) values (2,'Deen','Hans','9 Street Address','Cape Town',null);
Insert into HOSPITAL.PATIENT (ID,NAME,SURNAME,ADDRESS,CITY,ID_NUMBER) values (3,'Dean','VanNiekerk','7 Street address, Plain','Cape Town',null);
Insert into HOSPITAL.PATIENT (ID,NAME,SURNAME,ADDRESS,CITY,ID_NUMBER) values (22,'Joe','Doe','4 Church Street','Cape Town','8456254422366');
Insert into HOSPITAL.PATIENT (ID,NAME,SURNAME,ADDRESS,CITY,ID_NUMBER) values (23,'Joe','Doe','4 Church Street','Cape Town','8456254422366');
REM INSERTING into HOSPITAL.PAYMENT
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (1,200);
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (1,200);
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (2,200);
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (1,200);
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (1,289.283328698014936448678496705670198021);
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (1,237.74);
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (1,294.78);
Insert into HOSPITAL.PAYMENT (APPOINTMENT_ID,AMOUNT) values (1,271.62);
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
--  Constraints for Table PATIENT
--------------------------------------------------------

  ALTER TABLE "HOSPITAL"."PATIENT" ADD CONSTRAINT "PATIENT_ID" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HOSPITAL"."PATIENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table APPOINTMENT
--------------------------------------------------------

  ALTER TABLE "HOSPITAL"."APPOINTMENT" ADD CONSTRAINT "DOCTOR_FK" FOREIGN KEY ("DOCTOR_ID")
	  REFERENCES "HOSPITAL"."DOCTOR" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "HOSPITAL"."APPOINTMENT" ADD CONSTRAINT "PATIENT_FK" FOREIGN KEY ("PATIENT_ID")
	  REFERENCES "HOSPITAL"."PATIENT" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  DDL for Trigger APP_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOSPITAL"."APP_TRG" before insert on "HOSPITAL"."APPOINTMENT"    for each row begin     if inserting then       if :NEW."ID" is null then          select APPOINTMENT_SEQ.nextval into :NEW."ID" from dual;       end if;    end if; end;
/
ALTER TRIGGER "HOSPITAL"."APP_TRG" ENABLE;
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
AFTER INSERT ON appointment
DECLARE
rand_val NUMBER;
BEGIN
    rand_val := ROUND(dbms_random.value(200,300),2);
Insert into payment(appointment_id,amount) VALUES( 1, rand_val);

END;
/
ALTER TRIGGER "HOSPITAL"."PAY_FOR_APPOINTMENT" ENABLE;
--------------------------------------------------------
--  DDL for Package APPOINTMENTS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HOSPITAL"."APPOINTMENTS" As

procedure create_appointment(p_date_time varchar2, p_reason varchar2, p_doctor_id NUMBER, p_patient_id NUMBER);
function get_all_appointments return sys_refcursor;
function get_all_todays_appointments return sys_refcursor;

END appointments;

/

--------------------------------------------------------
--  DDL for Package DOCTORS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HOSPITAL"."DOCTORS" AS

procedure create_doctor(p_name varchar2, p_surname varchar2);
function get_doctor_appointments(p_doctor_id number) return sys_refcursor;
function get_doctor_monthly_earnings(p_doctor_id number) return NUMBER;
function get_available_doctors return sys_refcursor;

END;

/

--------------------------------------------------------
--  DDL for Package PATIENTS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HOSPITAL"."PATIENTS" AS

procedure create_patient(p_name varchar2, p_surname varchar2,p_address varchar2,p_city varchar2, p_id_number varchar2);
function get_patient_appointments(p_patient_id_number number) return sys_refcursor;
function get_patient_monthly_owing(p_patient_id number) return NUMBER;

END;

/

--------------------------------------------------------
--  DDL for Package Body APPOINTMENTS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HOSPITAL"."APPOINTMENTS" As

procedure create_appointment(p_date_time varchar2, p_reason varchar2, p_doctor_id NUMBER, p_patient_id NUMBER) AS
BEGIN
    INSERT INTO appointment(date_time, reason, doctor_id, patient_id) VALUES(p_date_time, p_reason, p_doctor_id, p_patient_id);
END create_appointment;

function get_all_appointments return sys_refcursor AS
all_appointments sys_refcursor;
  BEGIN
  OPEN all_appointments FOR SELECT * FROM appointment;
  
  return all_appointments;
  END get_all_appointments; 

function get_all_todays_appointments return sys_refcursor AS
todays_appointments sys_refcursor;
  BEGIN
  OPEN todays_appointments FOR SELECT * FROM Appointment where to_char(date_time,'MM/DD/YYYY') = to_char(sysdate,'MM/DD/YYYY');
  
  return todays_appointments;
END get_all_todays_appointments;

END appointments;

/

--------------------------------------------------------
--  DDL for Package Body DOCTORS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HOSPITAL"."DOCTORS" AS

procedure create_doctor(p_name varchar2, p_surname varchar2) AS 
BEGIN 
  INSERT INTO doctor(name,surname,is_available) VALUES(p_name,p_surname,1);
END create_doctor;

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
  
  return ROUND(v_total_earnings,2);
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

procedure create_patient(p_name varchar2, p_surname varchar2,p_address varchar2,p_city varchar2, p_id_number varchar2) AS
BEGIN 
    INSERT INTO patient(name, surname,address,city,id_number)
    VALUES(p_name, p_surname,p_address,p_city,p_id_number);
END create_patient;

function get_patient_appointments(p_patient_id_number number) return sys_refcursor AS
patient_appointments sys_refcursor;
v_temp_id_number varchar2(20);
BEGIN
  SELECT id_number INTO v_temp_id_number FROM patient WHERE id_number = p_patient_id_number;
  OPEN patient_appointments FOR SELECT * FROM appointment a WHERE a.patient_id = v_temp_id_number;
  return patient_appointments;
  
END get_patient_appointments;
 
function get_patient_monthly_owing(p_patient_id number) return NUMBER AS 
v_owing NUMBER;
BEGIN
SELECT SUM(p.amount) INTO v_owing FROM payment p
  INNER JOIN appointment a
  ON a.id = p.appointment_id
  WHERE a.patient_id = p_patient_id;
  
  return ROUND(v_owing,2);
END get_patient_monthly_owing;

END;

/

