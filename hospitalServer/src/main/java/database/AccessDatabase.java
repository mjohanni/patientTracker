package database;

import models.Medication;
import models.Patient;
import models.UserLogin;
import util.TextToMap;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

//String hcp; Integer status; Integer id; String firstName; String lastName; String startDate;
// String endDate; Integer age; List<Medication> medications; String symptoms; String notes;

public class AccessDatabase {
    private static final String CONN = "jdbc:sqlite:hospitalDatabase.db";

    public Connection connect() {
        Connection conn = null;
        if (isSuitableDriverAvailable()) {
            try {
                conn = DriverManager.getConnection(CONN);
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }else{
            System.err.println("The Driver was not correctly loaded and program was aborted");
        }
        return conn;
    }

    public boolean isSuitableDriverAvailable(){
        try{
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            return false;
        }
        return true;
    }

    public Patient getPatientById(Integer id) throws SQLException, IOException {
       Patient patient = new Patient();
        Connection conn = connect();
        String sql = "SELECT * FROM patients WHERE "+"'"+id+"' = id";
        Statement statement = conn.createStatement();
        ResultSet result = statement.executeQuery(sql);

        while(result.next()){
            System.out.println("searching database");
            if (id == result.getInt("id")){
                System.out.println(result.getInt("id"));
                System.out.println(result.getString("text"));
                System.out.println(result.getString("name"));

                patient.setHcp(result.getString("hcp"));
                patient.setStatus(result.getInt("status"));
                patient.setId(result.getInt("id"));
                patient.setFirstName(result.getString("firstName"));
                patient.setLastName(result.getString("lastName"));
                patient.setAge(result.getInt("age"));
                //List<Medication> medications;
                //insert functionality to convert medication string list to a list of medication Objects
                String meds = result.getString("medication");
                TextToMap mapping = new TextToMap();
                patient.setMedications(mapping.textToMap(meds));
                patient.setStartDate(result.getString("startDate"));
                patient.setEndDate(result.getString("endDate"));
                patient.setSymptoms(result.getString("symptoms"));
                patient.setNotes(result.getString("notes"));
                return patient;
            }
        }
        System.out.println("patient does not exist!");
        return null;
    }

    public List<Patient> selectAll(String hcp) throws SQLException {
        String sql = "SELECT * FROM patients WHERE '"+hcp+"' = hcp";
        List<Patient> listPatients = new ArrayList<>();
        Patient newPatient = new Patient();
        Patient tempPatient;
        Statement statement;
        try (Connection conn = connect()) {
            statement = conn.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                System.out.println(
                        result.getInt("id") + "\t" +
                                result.getString("hcp") + "\t" +
                                result.getString("firstName") + "\t" +
                                result.getString("lastName") + "\t" +
                                result.getString("age") + "\t" +
                                result.getInt("status") + "\t" +
                                result.getString("startDate") + "\t" +
                                result.getString("endDate") + "\t" +
                                result.getString("Medication") + "\t" +
                                result.getString("symptoms") + "\t" +
                                result.getString("notes")
                );
                newPatient.setId(result.getInt("id"));
                newPatient.setHcp(result.getString("hcp"));
                newPatient.setFirstName(result.getString("firstName"));
                newPatient.setLastName(result.getString("lastName"));
                newPatient.setAge(result.getInt("age"));
                newPatient.setStatus(result.getInt("status"));
                newPatient.setStartDate(result.getString("startDate"));
                newPatient.setEndDate(result.getString("endDate"));
                //Medication to list conversion
                String meds = (result.getString("Medication"));
                TextToMap mapping = new TextToMap();
                newPatient.setMedications(mapping.textToMap(meds));
                newPatient.setSymptoms(result.getString("symptoms"));
                newPatient.setNotes(result.getString("notes"));
                tempPatient = newPatient;
                newPatient = new Patient();
                listPatients.add(tempPatient);
            }
        }catch (SQLException | IOException e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return listPatients;
    }

    public void insert(Patient patient){
        String sql = "INSERT INTO patients (\n" +
                "                       hcp,\n" +
                "                       firstName,\n" +
                "                       lastName,\n" +
                "                       status,\n" +
                "                       age,\n" +
                "                       startDate,\n" +
                "                       endDate,\n" +
                "                       medication,\n" +
                "                       symptoms,\n" +
                "                       notes\n" +
                "                   )\n" +
                "                   VALUES (\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?\n" +
                "                   );";
        try (Connection conn = connect();
             PreparedStatement preState = conn.prepareStatement(sql)){
            preState.setString(1,patient.getHcp());
            preState.setString(2,patient.getFirstName());
            preState.setString(3,patient.getLastName());
            preState.setInt(4,patient.getAge());
            preState.setInt(5,patient.getStatus());
            preState.setString(6,patient.getStartDate());
            preState.setString(7,patient.getEndDate());
            preState.setString(8, Arrays.asList(patient.getMedications()).toString());
            preState.setString(9,patient.getSymptoms());
            preState.setString(10,patient.getNotes());

            preState.execute();
            System.out.println("patient has been added");
        }
        catch (SQLException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public void updatePatient(Patient patient){
        String sql = "UPDATE patients SET (\n" +
                "                       hcp,\n" +
                "                       firstName,\n" +
                "                       lastName,\n" +
                "                       status,\n" +
                "                       age,\n" +
                "                       startDate,\n" +
                "                       endDate,\n" +
                "                       medication,\n" +
                "                       symptoms,\n" +
                "                       notes\n" +
                "                   )\n" +
                "                   VALUES (\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?,\n" +
                "                       ?\n" +
                "                   )\n" +
                "WHERE id = ?;";
        try (Connection conn = connect();
             PreparedStatement preState = conn.prepareStatement(sql)){
            preState.setString(1,patient.getHcp());
            preState.setString(2,patient.getFirstName());
            preState.setString(3,patient.getLastName());
            preState.setInt(4,patient.getStatus());
            preState.setInt(5,patient.getAge());
            preState.setString(6,patient.getStartDate());
            preState.setString(7,patient.getEndDate());
            preState.setString(8, Arrays.asList(patient.getMedications()).toString());
            preState.setString(9,patient.getSymptoms());
            preState.setString(10,patient.getNotes());
            preState.setInt(11,patient.getId());

            preState.execute();
            System.out.println("patient has been updated");
        }
        catch (SQLException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public void signUp(UserLogin userLogin){
        String sql = "SELECT * FROM login WHERE '"+userLogin.getUsername()+"' = hcp OR '"+ userLogin.getEmail()+"' = email";
        Statement statement;
        try (Connection conn = connect()) {
            statement = conn.createStatement();
            ResultSet result = statement.executeQuery(sql);
            conn.close();
            if(result == null){
                String signUpSql = "INSERT INTO login (\n" +
                        "                       hcp,\n" +
                        "                       email,\n" +
                        "                       password\n" +
                        "                   )\n" +
                        "                   VALUES (\n" +
                        "                       ?,\n" +
                        "                       ?,\n" +
                        "                       ?\n" +
                        "                   );";
                try (Connection connect = connect();
                     PreparedStatement preState = connect.prepareStatement(signUpSql)){
                    preState.setString(1,userLogin.getUsername());
                    preState.setString(2,userLogin.getEmail());
                    preState.setString(3,userLogin.getPassword());

                    preState.execute();
                    System.out.println("user has been added");
                }
                catch (SQLException e){
                    System.out.println(e.getMessage());
                    e.printStackTrace();
                }
            }else{
                System.out.println("user already exists");
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public UserLogin login(String email, String password) throws SQLException {
        UserLogin userLogin = new UserLogin();
        Connection conn = connect();
        String sql = "SELECT * FROM login WHERE '"+email+"' = email AND '"+password+"' = password";
        Statement statement = conn.createStatement();
        ResultSet result = statement.executeQuery(sql);

        while(result.next()){
            System.out.println("searching database");
            if (email.equals(result.getString("email")) && password.equals(result.getString("password"))){
                System.out.println(result.getInt("hcp"));
                System.out.println(result.getString("email"));
                System.out.println(result.getString("password"));

                userLogin.setUsername(result.getString("hcp"));
                userLogin.setUsername(result.getString("username"));
                userLogin.setPassword(result.getString("password"));
                return userLogin;
            }
        }
        System.out.println("username or password incorrect.");
        userLogin.setUsername("empty");
        userLogin.setEmail("empty");
        userLogin.setPassword("empty");
        return null;
    }
}
