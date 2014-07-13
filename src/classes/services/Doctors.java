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
import javax.swing.JTable;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Brandon1
 */
public class Doctors {
    private int id;
    private String name;
    private String surname;
    private int is_available;
    
    public Doctors() {
    }
    
    private Connection connect_to_db()
    {
        return DB_connection.instance();
    }
    
    public void create_Doctor(Doctors doc)
    {
        try {
            Connection conn = connect_to_db();
            
            CallableStatement cs = conn.prepareCall("DECLARE P_NAME VARCHAR2(200); P_SURNAME VARCHAR2(200); BEGIN P_NAME := ?; P_SURNAME := ?; DOCTORS.CREATE_DOCTOR(P_NAME => P_NAME,P_SURNAME => P_SURNAME);END;" );
            cs.setString(1,doc.getName());
            cs.setString(2,doc.getSurname());
            
            cs.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "An error occured while creating the doctor. Please try again.");            
        }
    }
    
    /*
        Ran, tested, working.
        Requires doctor_id
    */
    public List<Appointment> get_appointments(int doctor_id)
    {
        try {
            Connection conn = connect_to_db();
            
            if(conn == null)
                return null;
            CallableStatement cs = conn.prepareCall( "begin ? := doctors.get_doctor_appointments(?); end;" );
            cs.setInt(2, doctor_id);
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
                ap.setPatName(rs.getString("name"));
                ap.setPatSurname(rs.getString("surname"));
                ap.setStatus(rs.getString("status"));
                ap_list.add(count, ap);
                count++;
            }
            return ap_list;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "An error occured when fetching the data. Please try again.");
            return null;
        }
    }
    
    public int monthly_earnings(int doctor_id)
    {
        
        try {
            Connection conn = connect_to_db();
            
            CallableStatement cs = conn.prepareCall( "begin ? := doctors.get_doctor_monthly_earnings(?); end;" );
            cs.setInt(2, doctor_id);
            cs.registerOutParameter(1, OracleTypes.NUMBER);
            cs.execute();
            
            return cs.getInt(1);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "An error occured when fetching the data. Please try again.");
        }
        return 0;
    }
    
    public List<Doctors> available_doctors()
    {
        try {
            Connection conn = connect_to_db();
            
            if(conn == null)
                return null;
            CallableStatement cs = conn.prepareCall( "begin ? := doctors.get_available_doctors(); end;" );
            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.execute();
            
            ResultSet rs = (ResultSet)cs.getObject(1);
            
            List<Doctors> doc_list = new ArrayList<Doctors>();
            while(rs.next())
            {
                Doctors doc = new Doctors();
                doc.setId(rs.getInt("id"));
                doc.setIs_available(rs.getInt("is_available"));
                doc.setName(rs.getString("name"));
                doc.setSurname(rs.getString("surname"));
                     
                doc_list.add(doc);
            }
            return doc_list;
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "An error occured when fetching the data. Please try again.");
            return null;
        }
    }
    
    public List<Doctors> all_doctors()
    {
        try {
            Connection conn = connect_to_db();
            
            if(conn == null)
                return null;
            Statement stat = conn.createStatement();
            
            ResultSet rs = stat.executeQuery("SELECT * FROM doctor ORDER BY name");
            
            List<Doctors> doc_list = new ArrayList<Doctors>();
            while(rs.next())
            {
                Doctors doc = new Doctors();
                doc.setId(rs.getInt("id"));
                doc.setIs_available(rs.getInt("is_available"));
                doc.setName(rs.getString("name"));
                doc.setSurname(rs.getString("surname"));
                     
                doc_list.add(doc);
            }
            return doc_list;
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

    public int getIs_available() {
        return is_available;
    }

    public void setIs_available(int is_available) {
        this.is_available = is_available;
    }
            
    
}
