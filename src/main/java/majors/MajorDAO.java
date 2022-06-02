/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package majors;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * <<<<<<< HEAD @a
 *
 *
 * uthor Tung Nguyen
 */
public class MajorDAO {

    private final String GET_ALL_MAJOR = "SELECT id_major, major_name FROM tblMajor";
    private static final String GET_MAJOR_NAME = "SELECT major_name FROM tblMajor WHERE id_major = ?";

       public List<MajorDTO> getAllMajor() throws SQLException {
        List<MajorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

           try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_MAJOR);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id_major = rs.getString("id_major").trim();
                    String major_name = rs.getString("major_name");
                    list.add(new MajorDTO(id_major, major_name));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }
    public List<MajorDTO> getAllMajorList() throws SQLException {
        List<MajorDTO> majorList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_MAJOR);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String majorId = rs.getString("id_major");
                    String majorName = rs.getString("major_name");
                    majorList.add(new MajorDTO(majorId, majorName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return majorList;
    }

    public static String convertMajorName(String id) throws SQLException {
        String major_name = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_MAJOR_NAME);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    major_name = rs.getString("major_name");
                    return major_name;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }

        return major_name;
    }

}
