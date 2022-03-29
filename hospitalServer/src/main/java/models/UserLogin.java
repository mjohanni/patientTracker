package models;

import org.eclipse.jetty.server.Authentication;

public class UserLogin {
    private String hcp;
    private String email;
    private String password;

    public String getHcp() {
        return hcp;
    }

    public void setHcp(String hcp) {
        this.hcp = hcp;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public static UserLogin create(String hcp, String email, String password){
       UserLogin user = new UserLogin();
        user.setHcp(hcp);
        user.setEmail(email);
        user.setPassword(password);
        return user;
    }
}
