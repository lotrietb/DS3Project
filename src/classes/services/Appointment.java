/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.services;

import classes.db.DB_connection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Brandon1
 */
class Appointment {
    private int id;
    private Date date_time;
    private String reason;
    private int doctor_id;
    private int patient_id;
    private int appointment_status_id;

    public int getAppointment_status_id() {
        return appointment_status_id;
    }

    public void setAppointment_status_id(int appointment_status_id) {
        this.appointment_status_id = appointment_status_id;
    }

    public Appointment() {
    }
    
    private Connection connect_to_db()
    {
        return DB_connection.instance();
    }
    
    
    
    public void set_status(int appointment_id, int new_status)
    {
        try {
            Connection conn = connect_to_db();
            
            CallableStatement cs = conn.prepareCall( "begin appointments.set_status(?,?); end;" );
            cs.setInt(2, new_status);
            cs.setInt(1, appointment_id);
            cs.execute();
            appointment_status_id = appointment_id;
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "An error occured while doing the specified operation. Please try again.");
        }
    }
    
    public List<Appointment> get_according_to_status(int status)
    {
        try {
            Connection conn = connect_to_db();
            
            if(conn == null)
                return null;
            CallableStatement cs = conn.prepareCall( "begin ? := appointments.get_according_to_status(?); end;" );
            cs.setInt(2, status);
            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.execute();
            
            ResultSet rs = (ResultSet)cs.getObject(1);
            
            List<Appointment> ap_list = new ArrayList<Appointment>();
            int count = 0;
            while(rs.next())
            {
                Appointment ap = new Appointment();
                ap.setId(rs.getInt("id"));
                ap.setDate_time(rs.getDate("date_time"));
                ap.setDoctor_id(rs.getInt("doctor_id"));
                ap.setPatient_id(rs.getInt("patient_id"));
                ap.setReason(rs.getString("reason"));
                ap.setAppointment_status_id(rs.getInt("appointment_status_id"));
                ap_list.add(count, ap);
                count++;
            }
            return ap_list;
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "An error occured when fetching the data. Please try again.");
            return null;
        }
    }
    
    public void create_appointment(Appointment ap)
    {
        try {
            Connection conn = connect_to_db();
            CallableStatement cs = conn.prepareCall( "DECLARE BEGIN APPOINTMENTS.CREATE_APPOINTMENT( P_DATE_TIME => ?, P_REASON => ?, P_DOCTOR_ID => ?, P_PATIENT_ID => ? ); END;" );
          
            cs.setDate(1, ap.getDate_time());
            cs.setString(2, ap.getReason());
            cs.setInt(3, ap.getDoctor_id());
            cs.setInt(4, ap.getPatient_id());
            cs.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "An error occured while creating the appointment. Please try again.");            
        }
    }
    
    public List<Appointment> all_appointments()
    {
        try {
            Connection conn = connect_to_db();
            
            if(conn == null)
                return null;
            CallableStatement cs = conn.prepareCall( "begin ? := appointments.get_all_appointments(); end;" );
            
            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.execute();
            
            ResultSet rs = (ResultSet)cs.getObject(1);
            
            List<Appointment> ap_list = new ArrayList<Appointment>();
            int count = 0;
            while(rs.next())
            {
                Appointment ap = new Appointment();
                ap.setId(rs.getInt("id"));
                ap.setDate_time(rs.getDate("date_time"));
                ap.setDoctor_id(rs.getInt("doctor_id"));
                ap.setPatient_id(rs.getInt("patient_id"));
                ap.setReason(rs.getString("reason"));
                ap.setAppointment_status_id(rs.getInt("appointment_status_id"));
                ap_list.add(count, ap);
                count++;
            }
            return ap_list;
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "An error occured when fetching the data. Please try again.");
            return null;
        }
    }
    
    public List<Appointment> todays_appointments()
    {
        try {
            Connection conn = connect_to_db();
            
            if(conn == null)
                return null;
            CallableStatement cs = conn.prepareCall( "begin ? := appointments.get_all_todays_appointments(); end;" );
            
            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.execute();
            
            ResultSet rs = (ResultSet)cs.getObject(1);
            
            List<Appointment> ap_list = new ArrayList<Appointment>();
            int count = 0;
            while(rs.next())
            {
                Appointment ap = new Appointment();
                ap.setId(rs.getInt("id"));
                ap.setDate_time(rs.getDate("date_time"));
                ap.setDoctor_id(rs.getInt("doctor_id"));
                ap.setPatient_id(rs.getInt("patient_id"));
                ap.setReason(rs.getString("reason"));
                ap.setAppointment_status_id(rs.getInt("appointment_status_id"));
                ap_list.add(count, ap);
                count++;
            }
            return ap_list;
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "An error occured when fetching the data. Please try again.");
            return null;
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate_time() {
        return date_time;
    }

    public void setDate_time(Date date_time) {
        this.date_time = date_time;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }
    
    
    
}
