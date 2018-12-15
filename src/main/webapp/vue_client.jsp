<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.8.1/mustache.min.js"></script>

        <title>JSP Page</title>
        <script>
            $(document).ready(
                    function () {
                        showCustomersInState();
                        ModifyInfos();
                    }
            );
            function showCustomersInState() {
                $.ajax({
                    url: "AllPersoInfo",
                    dataType: "json",
                    success:
                            function (result) {
                                var template = $('#customerTemplate').html();
                                var processedTemplate = Mustache.to_html(template, {records: result.datasPerso});
                                console.log(processedTemplate);
                                $('#customerD').html(processedTemplate);
                            },
                    error: showError
                });
            }

            function ModifyInfos() {
                $.ajax({
                    url: "ModifyInfosClient",
                    data: {"email": "${sessionScope.email}"},
                    dataType: "json",
                    xhrFields: {
                        withCredentials: true
                    },
                    success: // La fonction qui traite les résultats
                            function (result) {
                                console.log("in");
                            },
                    error: showError
                });
            }

            function ModifyInfos() {
                $.ajax({
                    url: "ReadInfosClient",
                    data: {"id": "${sessionScope.id}", "name": "${sessionScope.name}", "telephone": "${sessionScope.telephone}", "email": "${sessionScope.email}", "adresse": "${sessionScope.adresse}", "state": "${sessionScope.state}", "city": "${sessionScope.city}"},
                    dataType: "json",
                    success:
                            function (result) {
                                console.log("salut :)");
                            },
                    error: showError
                });
                return false;
            }



            function showError(xhr, status, message) {
                alert(JSON.parse(xhr.responseText).message);
            }

        </script>

        <style>
            #customerTemplate {
                font-family: 'Roboto', sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #customerTemplate td, #customerTemplate th {
                text-align: center; 
                vertical-align: middle;
                border: 1px solid #ddd;
                padding: 8px;
            }

            #customerTemplate tr:nth-child(even){background-color: #f2f2f2;}

            #customerTemplate tr:hover {background-color: #ddd;}

            #customerTemplate th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
        </style>

    </head>

    <body>

        <h1> Bienvenue ${sessionScope.name} </h1>
        <div id="customerD"></div>
        </br>

        <form method="POST">
            <input type="SUBMIT" name="action" value="Deconnexion">
        </form>       

        <script id="customerTemplate" type="text/template">
            <h2>Customers datas</h2>
            <table align="center" id="customerTemplate">
            <tr>
            <th>ID</th>
            <th>NOM</th>
            <th>TELEPHONE</th>
            <th>EMAIL</th>
            <th>ADRESSE</th>
            <th>STATE</th>
            <th>CITY</th>
            </tr>
            {{#records}}
            <tr>
            <td>{{customerid}}</td>
            <td>{{name}}</td>
            <td>{{phone}}</td>
            <td>{{email}}</td>
            <td>{{adress}}</td>
            <td>{{state}}</td>
            <td>{{city}}</td>
            </tr>
            {{/records}}
            </table>
        </script>

    </body>

</html>