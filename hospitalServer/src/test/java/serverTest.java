import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import kong.unirest.UnirestException;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import server.PatientServer;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TestServer {

    @Test
    @DisplayName("server tests running")
    public void serverTest() {
        PatientServer quoteServer = new PatientServer();
        quoteServer.start(5000);

        HttpResponse<String> response = Unirest.get("http://localhost:5000/server/login/matto/12345").asString();
        assertEquals(200, response.getStatus());
        quoteServer.stop();
    }
}

