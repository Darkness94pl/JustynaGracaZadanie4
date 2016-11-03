<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- //[START imports]--%>
<%@ page import="com.example.guestbook.Uzytkownik" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%-- //[END imports]--%>

<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>

<body>
        <form method="post" action="/register">
        <div class="container">
        <div class="row">
        <div class="col-md-4">
          <div class="form-group">
            <label for="imie">Imie</label>
            <input type="imie" name="imie" class="form-control" id="imie" placeholder="Wpisz imie" required>
          </div>
          <div class="form-group">
             <label for="nazwisko">Nazwisko</label>
             <input type="nazwisko" name="nazwisko" class="form-control" id="nazwisko" placeholder="Wpisz nazwisko" required>
           </div>
          <div class="form-group">
            <label for="email">Email address</label>
            <input type="email" name="email" class="form-control" id="email" placeholder="Wpisz email" required>
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" class="form-control" id="password" placeholder="Podaj password" required>
          </div>
          <button type="submit" class="btn btn-primary">Zarejestruj</button>
          </div>
          </div>
          </div>
        </form>

        <%
              List<Uzytkownik> uzytkownicy = ObjectifyService.ofy()
                  .load()
                  .type(Uzytkownik.class)
                  .list();

        %>
<%
        for (Uzytkownik user : uzytkownicy) {
            pageContext.setAttribute("email", user.Email);
            pageContext.setAttribute("imie", user.Imie);
            pageContext.setAttribute("nazwisko", user.Nazwisko);

%>
<p>Zarejestrowany uzytkownik : <b>${fn:escapeXml(imie)}</b> <b>${fn:escapeXml(nazwisko)}</b> <b>${fn:escapeXml(email)}</b></p>
<%
        }
%>
</body>
</html>