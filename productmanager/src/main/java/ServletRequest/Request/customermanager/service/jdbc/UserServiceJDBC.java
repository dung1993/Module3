package ServletRequest.Request.customermanager.service.jdbc;

public class UserServiceJDBC {
    public static boolean checkUserNamePassword(String username, String password) {
        if (username.equals("admin") && password.equals("admin")) {
            return true;
        }
        return false;
    }
}
