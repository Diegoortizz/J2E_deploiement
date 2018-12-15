<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style_main_test.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    </head>
    <body>
        <form method="POST">
            <label> Login : <input name="log" required="required" value="jumboeagle@example.com"></label> <br>
            <label> Mot de passe : <input name="mdp" required="required" value="1"></label>
            <input name="action" value="Connexion" type="SUBMIT">
        </form>  

        
        
        
        
        <c:if  test="${not correct}">
            <div style="color:red;"> Mot de passe ou login incorrect </div>
        </c:if>
    </body>
</html>

