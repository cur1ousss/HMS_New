
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * frmLogin.java
 *
 * Created on May 6, 2017, 12:03:51 PM
 */

/**
 *
 * @author PC 20
 */
public class frmLogin extends javax.swing.JFrame {

    /** Creates new form frmLogin */
    public frmLogin() {
        initComponents();
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        t_usr = new javax.swing.JTextField();
        b_login = new javax.swing.JButton();
        t_pwd = new javax.swing.JPasswordField();
        jLabel3 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Login");
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowOpened(java.awt.event.WindowEvent evt) {
                formWindowOpened(evt);
            }
        });
        getContentPane().setLayout(null);

        jLabel1.setFont(new java.awt.Font("Maiandra GD", 1, 14)); // NOI18N
        jLabel1.setText("User Name");
        getContentPane().add(jLabel1);
        jLabel1.setBounds(420, 200, 100, 20);

        jLabel2.setFont(new java.awt.Font("Maiandra GD", 1, 14)); // NOI18N
        jLabel2.setText("Password");
        getContentPane().add(jLabel2);
        jLabel2.setBounds(420, 270, 70, 18);

        t_usr.setFont(new java.awt.Font("Times New Roman", 0, 18)); // NOI18N
        getContentPane().add(t_usr);
        t_usr.setBounds(510, 200, 160, 30);

        b_login.setFont(new java.awt.Font("Maiandra GD", 1, 16)); // NOI18N
        b_login.setText("Login");
        b_login.setOpaque(false);
        b_login.setVerifyInputWhenFocusTarget(false);
        b_login.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                b_loginActionPerformed(evt);
            }
        });
        getContentPane().add(b_login);
        b_login.setBounds(560, 300, 80, 30);
        getContentPane().add(t_pwd);
        t_pwd.setBounds(510, 260, 160, 33);

        jLabel3.setIcon(new javax.swing.ImageIcon("C:\\Users\\SAMSUNG\\Documents\\NetBeansProjects\\HMS\\HMS 28 dec\\HMS_&\\projct OMAGES\\main-login.jpg")); // NOI18N
        jLabel3.setOpaque(true);
        getContentPane().add(jLabel3);
        jLabel3.setBounds(0, -10, 800, 530);

        pack();
    }// </editor-fold>//GEN-END:initComponents

Connection con=null;
Statement stmt=null;
String dr="java.sql.Driver";
String url="jdbc:mysql://localhost:3306/hms?zeroDateTimeBehavior=convertToNull";
String usr="root";
String pwd="";
String qry="";
ResultSet rs=null;

    private void b_loginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_b_loginActionPerformed
        // TODO add your handling code here:

          try{
              
        Class.forName(dr);
        con=DriverManager.getConnection(url, usr, pwd);
        stmt=con.createStatement();
        String pass=new String (t_pwd.getPassword());
        qry="select * from login where usr_nm='"+t_usr.getText()+"' and  pwd='"+pass+"'";
        rs=stmt.executeQuery(qry);

        int reccount=0;

            while(rs.next())    

            {
                reccount++;
            }

        if(reccount==0)     
            {
            JOptionPane.showMessageDialog(rootPane, "invalid password or usename!!! ");
        }

        else if (reccount>0)        
        {
            frmMDI frm= new frmMDI();
            frm.setVisible(true);
           JOptionPane.showMessageDialog(rootPane, "Logged In.....welcome");
           this.dispose();
        }

          }catch(Exception e){JOptionPane.showMessageDialog(rootPane, e + "\n failed");}


         
          

    }//GEN-LAST:event_b_loginActionPerformed

    private void formWindowOpened(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowOpened
        // TODO add your handling code here:
        this.setBounds(250, 120, 802, 517);
        
    }//GEN-LAST:event_formWindowOpened

    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new frmLogin().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton b_login;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPasswordField t_pwd;
    private javax.swing.JTextField t_usr;
    // End of variables declaration//GEN-END:variables

}
