<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projet J2E - PMD</title>

        <script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.8.1/mustache.min.js"></script>
        
        <style>
            #StyleTable {
                font-family: 'Roboto', sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #StyleTable td, #StyleTable th {
                text-align: center; 
                vertical-align: middle;
                border: 1px solid #ddd;
                padding: 8px;
            }

            #StyleTable tr:nth-child(even){background-color: #f2f2f2;}

            #StyleTable tr:hover {background-color: #ddd;}

            #StyleTable th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
        </style>
        
        <script>

            $(document).ready(
                    function () {
                        showCodesPO();
                    }
            );

            function showCodesPO() {
                $.ajax({
                    url: "allPO",
                    dataType: "json",
                    error: showError,
                    success:
                            function (result) {
                                var template = $('#codesTemplate1').html();
                                var processedTemplate = Mustache.to_html(template, result);
                                $('#affPO').html(processedTemplate);
                            }
                });
            }

            function showCodesP() {
                $.ajax({
                    url: "allP",
                    dataType: "json",
                    error: showError,
                    success:
                            function (result) {
                                var template = $('#codesTemplate2').html();
                                var processedTemplate = Mustache.to_html(template, result);
                                $('#affP').html(processedTemplate);
                            }
                });
            }

            function addPO(Product_ID) {
                $.ajax({
                    url: "addPO",
                    data: {"Product_ID": Product_ID, "id": '${sessionScope.id}'},
                    dataType: "json",
                    success:
                            function () {
                                showCodesPO();
                            },
                    error: showError
                });
                return false;
            }

            function deleteCode(order_num) {
                $.ajax({
                    url: "deletePO",
                    data: {"order_num": order_num},
                    dataType: "json",
                    success:
                            function () {
                                showCodesPO();
                            },
                    error: showError
                });
                return false;
            }
            
            function modifCode() {
                $.ajax({
                    url: "modifPO",
                    data: $("#codeForm").serialize(),
                    dataType: "json",
                    success: 
                        function () {
                            showCodesPO();
                        },
                    error: showError
                });
                return false;
            }

            function showError(xhr, status, message) {
                alert(JSON.parse(xhr.responseText).message);
            }

        </script>

    </head>

    <body>

        <h1>Voici vos commandes, ${sessionScope.name}</h1>

        <div id="affPO"></div>
        
        <form id="codeForm" onsubmit="event.preventDefault(); modifCode();">
            Numero de commande : <input id="order_num" name="order_num">
            Quantite : <input id="quantity" name="quantity">
            <input type="submit" value="Modifier">
        </form>  
        
        <a href='#' onclick='showCodesP()'>Passer une nouvelle commande</a>
        <div id="affP"></div>


        <script id="codesTemplate1" type="text/template">
            
            <table id="StyleTable">
            
                <tr>
                    <th>Numero de commande</th>
                    <th>Numero de client</th>
                    <th>Numero du produit</th>
                    <th>Quantité</th>
                    <th>Prix</th>
                    <th>Date de vente</th>
                    <th>Date de livraison</th>
                    <th>Action</th>
                </tr>
                
                {{#records}}
                    <tr>
                        <td>{{order_num}}</td>
                        <td>{{customer_id}}</td>
                        <td>{{product_id}}</td>
                        <td>{{quantity}}</td>
                        <td>{{shipping_cost}}</td>
                        <td>{{sales_date}}</td>
                        <td>{{shipping_date}}</td>
                        <th>
                            <button onclick="deleteCode('{{order_num}}')">Supprimer</button>
                        </th>
                    </tr>
                {{/records}}
            
            </table>
             
        </script>

        <script id="codesTemplate2" type="text/template">
            
            <table id="StyleTable">
            
                <tr>
                    <th>Numero du produit</th>
                    <th>Numero du fournisseur</th>
                    <th>Code du produit</th>
                    <th>Prix</th>
                    <th>Quantité disponible</th>
                    <th>Balisage</th>
                    <th>Disponible</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
                
                {{#records}}
                    <tr>
                        <td>{{Product_ID}}</td>
                        <td>{{Manufacturer_ID}}</td>
                        <td>{{Product_Code}}</td>
                        <td>{{Purchase_Cost}}</td>
                        <td>{{Quantity_on_hand}}</td>
                        <td>{{markup}}</td>
                        <td>{{available}}</td>
                        <td>{{Description}}</td>
                        <th>
                            <button onclick="addPO('{{Product_ID}}')">Commander</button>
                            
                        </th>
                    </tr>
                {{/records}}
            
            </table>
            
        </script>

        <form method="POST">
            <input type="SUBMIT" name="action" value="Deconnexion">
            <input type="SUBMIT" name="action" value="Vos informations">
        </form> 
    </body>

</html>

