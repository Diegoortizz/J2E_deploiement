<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projet J2E - PMD</title>

        <script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.8.1/mustache.min.js"></script>
        
        <script>
            
            
            
            function addP() {
                $.ajax({
                    url: "addP",
                    data: $("#codeForm").serialize(),
                    dataType: "json",
                    success:
                        function () {
                            console.log("ok");
                        },
                    error: showError
                });
                return false;
            }
        
        </script>
            
        
    </head>
    
    <body>
        
        <h1>Ajouter un nouveau produit</h1>
        
        <form id="codeForm" onsubmit="event.preventDefault(); addproduct();">
            PRODUCT_ID : <input id="PRODUCT_ID" name="PRODUCT_ID"><br/>
            MANUFACTURER_ID : <input id="MANUFACTURER_ID" name="MANUFACTURER_ID"><br/>
            PRODUCT_CODE : <input id="PRODUCT_CODE" name="PRODUCT_CODE"><br/>
            PURCHASE_COST : <input id="PURCHASE_COST" name="PURCHASE_COST"><br/>
            QUANTITY_ON_HAND : <input id="QUANTITY_ON_HAND" name="QUANTITY_ON_HAND"><br/>
            MARKUP : <input id="MARKUP" name="MARKUP"><br/>
            DESCRIPTION : <input id="DESCRIPTION" name="DESCRIPTION"><br/>
            <input type="submit" value="Ajouter">
        </form>
        
        
    </body>
    
</html>
