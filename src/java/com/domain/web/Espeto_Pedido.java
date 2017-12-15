package com.domain.web;

import java.util.ArrayList;

public class Espeto_Pedido {
String nome;
String desc;
int cd_espeto;
int qt_espeto;

    public int getCd_espeto() {
        return cd_espeto;
    }

    public void setCd_espeto(int cd_espeto) {
        this.cd_espeto = cd_espeto;
    }

    public int getQt_espeto() {
        return qt_espeto;
    }

    public void setQt_espeto(int qt_espeto) {
        this.qt_espeto = qt_espeto;
    }
    public static ArrayList<Espeto_Pedido> list;

    public static ArrayList<Espeto_Pedido> getlist() {
        if (list == null) {
            list = new ArrayList<>();
            Espeto_Pedido lista = new Espeto_Pedido();
            lista.setQt_espeto(0);
            lista.setCd_espeto(0);
            list.add(lista);
        }
        return list;
    }
}
