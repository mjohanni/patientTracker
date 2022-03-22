package server;

import io.javalin.Javalin;

public class PatientServer {
    private final Javalin server;

    public PatientServer() {
        this.server = Javalin.create();
    }

    public void start(int port){
        this.server.start(port);
    }

    public void stop(){
        this.server.stop();
    }

    public static void main(String[] args){
        PatientServer server = new PatientServer();
        server.start(8080);
    }
}
