package server;

import database.AccessDatabase;
import io.javalin.http.Context;
import io.javalin.http.NotFoundResponse;
import models.LoggingIn;
import models.Medication;
import models.Patient;
import models.UserLogin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class ApiController {

    private static final AccessDatabase database = new AccessDatabase();

    public static void getPatientList(Context context) throws SQLException {
        String doctorName = context.pathParamAsClass("name", String.class).get();
        List<Patient> doctorsPatients = database.selectAll(doctorName);
        if (doctorsPatients == null){
            throw  new NotFoundResponse("data not found");
        }
        context.json(doctorsPatients);
    }

    public static void addPatient(Context context) throws SQLException {
        //fix medication list sort
    }

    public static void patientDetails(Context context) throws SQLException, IOException {
        String id = context.pathParamAsClass("id", String.class).get();
        database.getPatientById(Integer.parseInt(id));

    }

    public static void updatePatient(Context context){
        Medication meds;
        Patient patient = context.bodyAsClass(Patient.class);
    }

    public static void changePatientStatus(Context context){

    }

    public static void login(Context context) throws SQLException {
        String username = context.pathParamAsClass("username", String.class).get();
        String password = context.pathParamAsClass("password", String.class).get();
        UserLogin result = database.login(username,password);
        context.json(result);
    }

    public static void signup(Context context){
        UserLogin userLogin = context.bodyAsClass(UserLogin.class);
        database.signUp(userLogin);
        context.json("Success");
    }
}
