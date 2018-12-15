<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.8.1/mustache.min.js"></script>

        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> 

        <title>JSP Page</title>
        <script>

            var selectedState;

            $(document).ready(
                    function () {

                        fillInput();
                        appendSelect();
                    }
            );

            function appendSelect() {
                let statesL = ["AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FM", "FL", "GA", "GU", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MH", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PW", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VI", "VA", "WA", "WV", "WI", "WY"];
                var select = document.getElementById("statesSelect");

                for (i = 0; i < statesL.length; i++) {
                    var option = document.createElement("option");
                    option.text = statesL[i];
                    option.value = statesL[i];
                    select.appendChild(option);
                }
                var cpt;
                for (i = 0; i < statesL.length; i++) {
                    if (select[i].value == selectedState) {
                        cpt = i;
                    }
                }


                document.getElementById('statesSelect').selectedIndex = cpt;


            }


            function fillInput() {
                var select = document.getElementById("statesSelect");

                $.ajax({
                    url: "AllPersoInfo",
                    dataType: "json",
                    success:
                            function (result) {
                                console.log(result.datasPerso);
                                $("#id").val(result.datasPerso["customerid"]);
                                $("#email").val(result.datasPerso["email"]);
                                $("#name").val(result.datasPerso["name"]);
                                $("#telephone").val(result.datasPerso["phone"]);
                                $("#adresse").val(result.datasPerso["adress"]);
                                $("#state").val(result.datasPerso["state"]);
                                $("#city").val(result.datasPerso["city"]);
                                $("#credit").val(result.datasPerso["creditlimit"]);
                                selectedState = result.datasPerso["state"];
                                select.value = (result.datasPerso["state"]);
                                appendSelect();

                            },
                    error: showError
                });
            }



            function UpdateForm() {
                $.ajax({
                    url: "ModifyInfosClient",
                    data: $("#codeForm").serialize(),
                    success:
                            function () {
                                fillInput();
                                GetEveryStates();
                            },
                    error: showError
                });
            }

            function GetEveryStates() {
                $.ajax({
                    url: "EveryStates",
                    dataType: "json",
                    success:
                            function (result) {
                                console.log(result);
                            },
                    error: showError
                });
            }


            function showError(xhr, status, message) {
                alert(JSON.parse(xhr.responseText).message);
            }


        </script>
        <style type="text/css">
            .form-style-5{
                max-width: 500px;
                padding: 10px 20px;
                background: #f4f7f8;
                margin: 10px auto;
                padding: 20px;
                background: #f4f7f8;
                border-radius: 8px;
                font-family: 'Roboto', sans-serif;


            }
            .form-style-5 fieldset{
                border: none;
            }
            .form-style-5 legend {
                font-size: 1.4em;
                margin-bottom: 10px;
            }
            .form-style-5 label {
                display: block;
                margin-bottom: 8px;
            }
            .form-style-5 input[type="text"],
            .form-style-5 input[type="date"],
            .form-style-5 input[type="datetime"],
            .form-style-5 input[type="email"],
            .form-style-5 input[type="number"],
            .form-style-5 input[type="search"],
            .form-style-5 input[type="time"],
            .form-style-5 input[type="url"],
            .form-style-5 textarea,
            .form-style-5 select {
                font-family: Georgia, 'Roboto', sans-serif;
                background: rgba(255,255,255,.1);
                border: none;
                border-radius: 4px;
                font-size: 15px;
                margin: 0;
                outline: 0;
                padding: 10px;
                width: 100%;
                box-sizing: border-box; 
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box; 
                background-color: #e8eeef;
                color:#8a97a0;
                -webkit-box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
                box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
                margin-bottom: 30px;
            }


            .form-style-5 input[type="text"]:focus,
            .form-style-5 input[type="date"]:focus,
            .form-style-5 input[type="datetime"]:focus,
            .form-style-5 input[type="email"]:focus,
            .form-style-5 input[type="number"]:focus,
            .form-style-5 input[type="search"]:focus,
            .form-style-5 input[type="time"]:focus,
            .form-style-5 input[type="url"]:focus,
            .form-style-5 textarea:focus,
            .form-style-5 select:focus{
                background: #d2d9dd;
            }
            .form-style-5 select{
                -webkit-appearance: menulist-button;
                height:35px;
            }
            .form-style-5 .number {
                background: #1abc9c;
                color: #fff;
                height: 30px;
                width: 30px;
                display: inline-block;
                font-size: 0.8em;
                margin-right: 4px;
                line-height: 30px;
                text-align: center;
                text-shadow: 0 1px 0 rgba(255,255,255,0.2);
                border-radius: 15px 15px 15px 0px;
            }

            .form-style-5 input[type="submit"],
            .form-style-5 input[type="button"]
            {
                position: relative;
                display: block;
                padding: 19px 39px 18px 39px;
                color: #FFF;
                margin: 0 auto;
                background: #1abc9c;
                font-size: 18px;
                text-align: center;
                font-style: normal;
                width: 100%;
                border: 1px solid #16a085;
                border-width: 1px 1px 3px;
                margin-bottom: 10px;
            }
            .form-style-5 input[type="submit"]:hover,
            .form-style-5 input[type="button"]:hover
            {
                background: #109177;
            }

            body{
                background-color: grey;
            }
            input:-moz-read-only { /* For Firefox */
                background-color: yellow;
            }

            input:read-only {
                background-color: yellow;
            }

        </style>
    </head>
    <body>

        <div class="form-style-5">
            <form id="codeForm" onsubmit="event.preventDefault();
                    UpdateForm();">
                <legend><span class="number">1</span>Informations client</legend>
                <div>
                    <label for="name">Nom</label>
                    <input type="text" name="name" id="name">
                </div>
                <div>
                    <label for="id">Id</label>
                    <input type="text" name="id" id="id" readonly="readonly">
                </div>
                <div>
                    <label for="credit">Credit</label>
                    <input type="number" name="credit" id="credit">
                </div>

                <legend> <span class="number">2</span>Localisation</legend>       
                <div>
                    <label for="statesSelect">Etat </label>
                    <select name="state" id="statesSelect">
                    </select>
                </div>
                <div>
                    <label for="city">Ville </label>
                    <input type="text" name="city" id="city">
                </div>
                <div>
                    <label for="adresse">Adresse</label>
                    <input type="text" name="adresse" id="adresse">
                </div>

                <legend> <span class="number">3</span>Renseignements</legend>
                <div>
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" readonly="readonly">
                </div>
                <div>
                    <label for="telephone">Telephone</label>
                    <input type="text" name="telephone" id="telephone">
                </div>
                <input type="submit" value="Modifier">
            </form>


            <form method="POST">
                <input type="SUBMIT" name="action" value="Deconnexion">
                <input type="SUBMIT" name="action" value="Vos commandes">
            </form> 
        </div>
    </body>
</html>
