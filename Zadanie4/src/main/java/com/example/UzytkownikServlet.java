package com.example.guestbook;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;

public class UzytkownikServlet extends HttpServlet {

  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    String email = req.getParameter("email");
    String password = req.getParameter("password");
    String imie = req.getParameter("imie");
    String nazwisko = req.getParameter("nazwisko");

    Uzytkownik uzytkownik = new Uzytkownik(email,password,imie,nazwisko);

    ObjectifyService.ofy().save().entity(uzytkownik).now();

    resp.sendRedirect("/register.jsp");
  }
}
//[END all]
