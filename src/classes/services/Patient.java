/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.services;

import classes.db.DB_connection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Brandon1
 */
public class Patient {
    private int id;
    private String name;
    private String surname;
    private String address;
    private String city;
    private String id_number;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getId_number() {
        return id_number;
    }

    public void setId_number(String id_number) {
        this.id_number = id_number;
    }
    
    public Patient() {
    }
    
    private Connection connect_to_db()
    {
        return DB_connection.instance();
    }
    
    public void create_patient(Patient pat)
    {
        try {
            Connection conn = connect_to_db();
            
            CallableStatement cs = conn.prepareCall("begin patients.create_patient(?,?,?,?,?); end;" );
            cs.setString(1,pat.getName());
            cs.setString(2,pat.getSurname());
            cs.setString(3,pat.getAddress());
            cs.setString(4,pat.getCity());
            cs.setString(5,pat.getId_number());
            
            cs.execute();
            System.out.println("Added patient");
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "An error occured while creating the patient. Please try again.");            
        }
    }
    
    public Patient get_by_id_number(String id_number)
    {
        try {
            Connection conn = connect_to_db();
            
            Statement stat = conn.createStatement();
            
            ResultSet rs = stat.executeQuery("SELECT * FROM patient WHERE id_number = "+id_number);
            Patient p = new Patient();
            while(rs.next())
            {
                p.setName(rs.getString("name"));
                p.setSurname(rs.getString("surname"));
                p.setCity(rs.getString("city"));
                p.setId_number(id_number);
                p.setId(rs.getInt("id"));
            }
            return p;
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "An error occured while searching for the patient. Please try again.");            
        }
        return null;
    }
    
    /*
        Ran, tested, working.
        Requires doctor_id
    */
    public List<Appointment> get_appointments(String patient_id)
    {
        try {
            Connection conn = connect_to_db();
            
            if(conn == null)
                return null;
            CallableStatement cs = conn.prepareCall( "begin ? := patients.get_patient_appointments(?); end;" );
            cs.setString(2, patient_id);
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
    
    public List<Patient> get_all_patients()
    {
        try {
            Connection conn = connect_to_db();
            
            if(conn == null)
                return null;
            CallableStatement cs = conn.prepareCall( "begin ? := patients.get_all; end;" );
            
            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.execute();
            
            ResultSet rs = (ResultSet)cs.getObject(1);
            
            List<Patient> patient_list = new ArrayList<Patient>();
            int count = 0;
            while(rs.next())
            {
                Patient patient = new Patient();
                patient.setId(rs.getInt("id"));
                patient.setAddress(rs.getString("address"));
                patient.setCity(rs.getString("City"));
                patient.setId_number(rs.getString("id_number"));
                patient.setName(rs.getString("name"));
                patient.setSurname(rs.getString("surname"));
                patient_list.add(count, patient);
                count++;
            }
            return patient_list;
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "An error occured when fetching the data. Please try again.");
            return null;
        }
    }
    
    public int monthly_owing(int patient_id)
    {
        
        try {
            Connection conn = connect_to_db();
            
            CallableStatement cs = conn.prepareCall( "begin ? := patients.get_patient_monthly_owing(?); end;" );
            cs.setInt(2, patient_id);
            cs.registerOutParameter(1, OracleTypes.NUMBER);
            cs.execute();
            
            return cs.getInt(1);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "An error occured when fetching the data. Please try again.");
        }
        return 0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }
            
    
}
