package com.domain.web;

import java.util.ArrayList;

public class Pedido {
private String cd;
private int qt;
private String nm;
private double preco;
private double total;

    
    public static ArrayList<Pedido> list;

    public static ArrayList<Pedido> getlist() {
        if (list == null) {
            list = new ArrayList<>();
            Pedido teste = new Pedido();
            teste.setCd("1");
            teste.setQt(1);
            list.add(teste);
        }
        return list;
    }

    public String getCd() {
        return cd;
    }

    public void setCd(String cd) {
        this.cd = cd;
    }

    public int getQt() {
        return qt;
    }

    public void setQt(int qt) {
        this.qt = qt;
    }

    public String getNm() {
        return nm;
    }

    public void setNm(String nm) {
        this.nm = nm;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

}
