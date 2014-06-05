--------------------------------------------------------
--  File created - Thursday-June-05-2014   
--------------------------------------------------------
  DROP PACKAGE "HOSPITAL"."APPOINTMENTS";
  DROP PACKAGE "HOSPITAL"."DOCTORS";
  DROP PACKAGE "HOSPITAL"."PATIENTS";
  DROP PACKAGE BODY "HOSPITAL"."APPOINTMENTS";
  DROP PACKAGE BODY "HOSPITAL"."DOCTORS";
  DROP PACKAGE BODY "HOSPITAL"."PATIENTS";
--------------------------------------------------------
--  DDL for Package APPOINTMENTS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HOSPITAL"."APPOINTMENTS" As

procedure create_appointment(p_date_time varchar2, p_reason varchar2, p_doctor_id NUMBER, p_patient_id NUMBER);
procedure set_status(p_appointment_id NUMBER, p_new_status NUMBER);

function get_according_to_status(p_status_id NUMBER) return sys_refcursor;
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
function get_patient_appointments(p_patient_id_number varchar2) return sys_refcursor;
function get_patient_monthly_owing(p_patient_id number) return NUMBER;
function get_all return sys_refcursor;

END;

/

--------------------------------------------------------
--  DDL for Package Body APPOINTMENTS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HOSPITAL"."APPOINTMENTS" As

procedure create_appointment(p_date_time varchar2, p_reason varchar2, p_doctor_id NUMBER, p_patient_id NUMBER) AS
BEGIN
    INSERT INTO appointment(date_time, reason, doctor_id, patient_id,appointment_status_id) VALUES(p_date_time, p_reason, p_doctor_id, p_patient_id,1);
END create_appointment;

procedure set_status(p_appointment_id NUMBER, p_new_status NUMBER) AS
BEGIN
    UPDATE appointment ap SET ap.appointment_status_id = p_new_status WHERE id = p_appointment_id;      
END set_status;

function get_according_to_status(p_status_id NUMBER) return sys_refcursor AS
appointments sys_refcursor;
BEGIN
     OPEN appointments FOR SELECT * FROM appointment WHERE appointment_status_id = p_status_id;
  
     return appointments;
END get_according_to_status;


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

function get_patient_appointments(p_patient_id_number varchar2) return sys_refcursor AS
patient_appointments sys_refcursor;
v_temp_id varchar2(20);
BEGIN
  SELECT id INTO v_temp_id FROM patient WHERE id_number = p_patient_id_number;
  OPEN patient_appointments FOR SELECT * FROM appointment a WHERE a.patient_id = v_temp_id;
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


function get_all return sys_refcursor AS
patients sys_refcursor;
BEGIN
  OPEN patients FOR SELECT * FROM patient;
  
  return patients;
  
END get_all;

END;

/

