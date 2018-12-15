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
                        showCodesP();
                    }
            );

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
            
            function deleteP(Product_ID) {
                $.ajax({
                    url: "deleteP",
                    data: {"Product_ID": Product_ID},
                    dataType: "json",
                    success:
                            function () {
                                showCodesP();
                            },
                    error: showError
                });
                return false;
            } 
            
            function modifP(Product_ID,Manufacturer_ID,Product_Code,Purchase_Cost,Quantity_on_hand,markup,available,Description) {
                
                w = open("",'popup','width=600,height=500,toolbar=no,scrollbars=no,resizable=yes');
                
                w.document.write("<title>"+"Modifitation du produit "+Product_ID+"</title>");
                w.document.write("<body>");
                w.document.write("<h1>Vous pouvez modifier le produit "+Product_ID+"</h1>");
                
                w.document.write("<form id='codeForm' onsubmit='event.preventDefault(); UpdateProduct()';>");
                    w.document.write("<input type='hidden' name='Product_ID' value=Product_ID>");
                    w.document.write("<p>Prix : "+Purchase_Cost+"</p>");
                        w.document.write("<input type='text' name='Purchase_Cost' id='Purchase_Cost'>");
                    w.document.write("<p>Quantité disponible : "+Quantity_on_hand+"</p>");
                        w.document.write("<input type='text' name='Quantity_on_hand' id='Quantity_on_hand'>");
                    w.document.write("<p>Balisage : "+markup+"</p>");
                        w.document.write("<input type='text' name='markup' id='markup'>");
                    w.document.write("<p>Description : "+Description+"</p>");
                        w.document.write("<input type='text' name='Description' id='Description'>");
                    w.document.write("<br>");
                    w.document.write("<br>");
                    w.document.write("<input type='submit'>");
                w.document.write("</form>");
                
                w.document.write("</body>");
                w.document.close();  
                
            }
            
            function UpdateProduct() {
                $.ajax({
                    url: "ModifyInfosProduct",
                    data: $("#codeForm").serialize(),
                    success:
                            function () {
                                showCodesP();
                            },
                    error: showError
                });
            }
            
            
            
            function showError(xhr, status, message) {
                alert(JSON.parse(xhr.responseText).message);
            }

        </script>

    </head>

    <body>

        <h1>Voici la liste des produits</h1>

        <div id="affP"></div>
        
        <form method="POST">
            <input type="SUBMIT" name="action" value="Accéder aux statistiques">
            <input type="SUBMIT" name="action" value="Ajouter un nouveau produit">
            <input type="SUBMIT" name="action" value="Deconnexion">
        </form> 
        
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
                        <td>
                            <button onclick="deleteP('{{Product_ID}}')">Supprimer</button>
                            <form name="f_popup">
                                <p><input type="button" value="Modifier" 
                                onclick="modifP('{{Product_ID}}','{{Manufacturer_ID}}','{{Product_Code}}','{{Purchase_Cost}}',
                                            '{{Quantity_on_hand}}','{{markup}}','{{available}}','{{Description}}')">
                            </form>
                        </td>
                    </tr>
                {{/records}}
            
            </table>
            
        </script>

    </body>

</html>

