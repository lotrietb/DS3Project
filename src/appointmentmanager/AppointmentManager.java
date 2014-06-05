/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package appointmentmanager;

import classes.services.Patient;
import java.util.List;

/**
 *
 * @author Clive
 */
public class AppointmentManager {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        java.awt.EventQueue.invokeLater(new Runnable() {
              public void run() {
                   MainMenu frame = new MainMenu();
                   frame.setVisible(true);
              }
        });
    }
    
}
