package com.example.guestbook;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

import java.lang.String;

@Entity
public class Uzytkownik {
    @Id
    public Long id;
    public String Email;
    public String Password;
    public String Imie;
    public String Nazwisko;

    public Uzytkownik(){}
    public Uzytkownik(String email, String password, String imie, String nazwisko) {
        Email = email;
        Password = password;
        Imie = imie;
        Nazwisko = nazwisko;
    }
}
