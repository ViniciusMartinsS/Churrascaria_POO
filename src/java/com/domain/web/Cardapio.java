package com.domain.web;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Cardapio {

    private String nome;
    private String desc;
    private String id;
    private String valor;

    public Cardapio(String nome, String desc, String id, String valor) {
        this.nome = nome;
        this.desc = desc;
        this.id = id;
        this.valor = valor;
    }

    public static ArrayList<Cardapio> getList() throws SQLException {
        ArrayList<Cardapio> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM cardapio");
        while (rs.next()) {
            Cardapio vs = new Cardapio(
                    rs.getString("nm_prato"),
                    rs.getString("ds_prato"),
                    rs.getString("id_prato"),
                    rs.getString("vl_valor")
            );
            list.add(vs);
        }
        rs.close();
        s.close();
        return list;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }
}
