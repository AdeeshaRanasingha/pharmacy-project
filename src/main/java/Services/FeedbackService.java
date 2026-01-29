package Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Controller.DBConnector;
import Model.Feedback;

public class FeedbackService {

    // INSERT feedback
    public static boolean insertFeedback(Feedback feedback) {
        boolean isSuccess = false;

        try {
            Connection conn = DBConnector.getConnection();
            String sql = "INSERT INTO feedback (userID, firstname, lastname, email, phone, message) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, feedback.getUserID());
            stmt.setString(2, feedback.getFirstname());
            stmt.setString(3, feedback.getLastname());
            stmt.setString(4, feedback.getEmail());
            stmt.setString(5, feedback.getPhone());
            stmt.setString(6, feedback.getMessage());

            isSuccess = stmt.executeUpdate() > 0;
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("❌ Error inserting feedback:");
            e.printStackTrace();
        }

        return isSuccess;
    }

 // GET feedback by specific user
    public static List<Feedback> getFeedbackByUserId(int userId) {
        List<Feedback> list = new ArrayList<>();

        try {
            Connection conn = DBConnector.getConnection();
            String sql = "SELECT * FROM feedback WHERE userID = ? ORDER BY submitted_at DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setId(rs.getInt("id"));
                fb.setUserID(rs.getInt("userID"));
                fb.setFirstname(rs.getString("firstname"));
                fb.setLastname(rs.getString("lastname"));
                fb.setEmail(rs.getString("email"));
                fb.setPhone(rs.getString("phone"));
                fb.setMessage(rs.getString("message"));
                fb.setSubmittedAt(rs.getTimestamp("submitted_at"));
                list.add(fb);
            }

            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("❌ Error fetching feedback by user ID:");
            e.printStackTrace();
        }

        return list;
    }


    // GET ONE feedback by ID
    public static Feedback getFeedbackById(int id) {
        Feedback fb = null;

        try {
            Connection conn = DBConnector.getConnection();
            String sql = "SELECT * FROM feedback WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                fb = new Feedback();
                fb.setId(rs.getInt("id"));
                fb.setUserID(rs.getInt("userID"));
                fb.setFirstname(rs.getString("firstname"));
                fb.setLastname(rs.getString("lastname"));
                fb.setEmail(rs.getString("email"));
                fb.setPhone(rs.getString("phone"));
                fb.setMessage(rs.getString("message"));
                fb.setSubmittedAt(rs.getTimestamp("submitted_at")); // 🆕 added
            }

            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("❌ Error fetching feedback by ID:");
            e.printStackTrace();
        }

        return fb;
    }

    // UPDATE feedback
    public static boolean updateFeedback(Feedback feedback) {
        boolean isSuccess = false;

        try {
            Connection conn = DBConnector.getConnection();
            String sql = "UPDATE feedback SET firstname = ?, lastname = ?, email = ?, phone = ?, message = ? WHERE id = ?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, feedback.getFirstname());
            stmt.setString(2, feedback.getLastname());
            stmt.setString(3, feedback.getEmail());
            stmt.setString(4, feedback.getPhone());
            stmt.setString(5, feedback.getMessage());
            stmt.setInt(6, feedback.getId());

            isSuccess = stmt.executeUpdate() > 0;
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("❌ Error updating feedback:");
            e.printStackTrace();
        }

        return isSuccess;
    }

    // DELETE feedback
    public static boolean deleteFeedbackById(int id) {
        boolean isSuccess = false;

        try {
            Connection conn = DBConnector.getConnection();
            String sql = "DELETE FROM feedback WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            isSuccess = stmt.executeUpdate() > 0;
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("❌ Error deleting feedback:");
            e.printStackTrace();
        }

        return isSuccess;
    }


//for view feedback for admin

public static List<Feedback> getAllFeedback() {
    List<Feedback> list = new ArrayList<>();

    try {
        Connection conn = DBConnector.getConnection();
        String sql = "SELECT * FROM feedback ORDER BY submitted_at DESC";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Feedback fb = new Feedback();
            fb.setId(rs.getInt("id"));
            fb.setUserID(rs.getInt("userID"));
            fb.setFirstname(rs.getString("firstname"));
            fb.setLastname(rs.getString("lastname"));
            fb.setEmail(rs.getString("email"));
            fb.setPhone(rs.getString("phone"));
            fb.setMessage(rs.getString("message"));
            fb.setSubmittedAt(rs.getTimestamp("submitted_at"));
            list.add(fb);
        }

        conn.close();
    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("❌ Error fetching all feedback:");
        e.printStackTrace();
    }

    return list;
}


//GET feedbacks matching specific userID (admin)
public static List<Feedback> searchFeedbackById(String idStr) {
 List<Feedback> list = new ArrayList<>();

 try {
     int id = Integer.parseInt(idStr);
     Connection conn = DBConnector.getConnection();
     String sql = "SELECT * FROM feedback WHERE userID = ?";
     PreparedStatement stmt = conn.prepareStatement(sql);
     stmt.setInt(1, id);
     ResultSet rs = stmt.executeQuery();

     while (rs.next()) {
         Feedback fb = new Feedback();
         fb.setId(rs.getInt("id"));
         fb.setUserID(rs.getInt("userID"));
         fb.setFirstname(rs.getString("firstname"));
         fb.setLastname(rs.getString("lastname"));
         fb.setEmail(rs.getString("email"));
         fb.setPhone(rs.getString("phone"));
         fb.setMessage(rs.getString("message"));
         fb.setSubmittedAt(rs.getTimestamp("submitted_at"));
         list.add(fb);
     }

     conn.close();
 } catch (Exception e) {
     System.out.println("❌ Error in searchFeedbackById:");
     e.printStackTrace();
 }

 return list;
}

}