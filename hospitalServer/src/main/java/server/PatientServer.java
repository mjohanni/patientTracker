package server;

import io.javalin.Javalin;

public class PatientServer {
    private final Javalin server;

    public PatientServer() {
        this.server = Javalin.create();

        this.server.get("/patients/{name}",context -> ApiController.getPatientList(context));
        this.server.get("/patients/patient", context -> ApiController.patientDetails(context));
        this.server.post("/patients/patient/update", context -> ApiController.updatePatient(context));
        this.server.get("server/login/{name}/{password}",context ->ApiController.login(context));
        this.server.post("server/signup",context -> ApiController.signup(context));
    }

    public void start(int port){
        this.server.start(port);
    }

    public void stop(){
        this.server.stop();
    }

    public static void main(String[] args){
        PatientServer server = new PatientServer();
        server.start(5005);
    }
}
