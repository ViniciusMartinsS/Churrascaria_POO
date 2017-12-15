package com.domain.web;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Funcionario {

    private int id;
    private String login;
    private String passwordHash;

    public static Funcionario getUser(String login, String password) throws SQLException {
        String SQL = "SELECT * FROM funcionario WHERE id_funcionario=? AND cd_senha=?";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setString(1, login);
        s.setString(2, password + "");
        ResultSet rs = s.executeQuery();
        Funcionario u = null;
        if (rs.next()) {
            u = new Funcionario(rs.getInt("id_funcionario"),
                     rs.getString("nm_funcionario"),
                     rs.getString("cd_senha"));
        }
        rs.close();
        s.close();
        return u;
    }

    public Funcionario(int id, String login, String passwordHash) {
        this.id = id;
        this.login = login;
        this.passwordHash = passwordHash;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }
}
