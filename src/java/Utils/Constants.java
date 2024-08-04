package Utils;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author thain
 */
// public static final String GOOGLE_OAUTH_CLIENT_ID = "your-client-id";
// public static final String GOOGLE_OAUTH_CLIENT_SECRET = "your-client-secret";

public class Constants {

    public static String GOOGLE_CLIENT_ID = "your-client-id";

    public static String GOOGLE_CLIENT_SECRET = "your-client-secret";
    

    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/ITJob/LoginGoogleHandler";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
