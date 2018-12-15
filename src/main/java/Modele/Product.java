/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 *
 * @author Matthias
 */
public class Product {
    private int Product_ID;
    private int Manufacturer_ID;
    private String Product_Code;
    private float Purchase_Cost;
    private int Quantity_on_hand;
    private float markup;
    private Boolean available;
    private String Description;
    
    public Product(int Product_ID, int m_id, String pc, float pur_c, int qh, float mark,Boolean available,String Description) {
		this.Product_ID = Product_ID;
                this.Manufacturer_ID=m_id;
                this.Product_Code=pc;
                this.Purchase_Cost=pur_c;
                this.Quantity_on_hand=qh;
                this.markup=mark;
                this.available=available;
		this.Description = Description;
	}
    
    public int getProduct_Id(){
        return Product_ID;
    }
    
    public int getManufacturer_Id(){
        return Manufacturer_ID;
    }
    
    public String getProduct_Code(){
        return Product_Code;
    }
    public float getPurchase_Cost(){
        return Purchase_Cost;
    }
    public int getQuantity_on_Hand(){
        return Quantity_on_hand;
    }
    
    public float getMarkup(){
        return markup;
                
    }
    
    public Boolean getAvailable(){
        return available;
    }
    
    public String getDescription(){
        return Description;
    }
    
    public Map<String, String> getAllAttributs() {
        
        Map<String, String> HM = new HashMap<String, String>();
        
        HM.put("Product_ID", Integer.toString(this.getProduct_Id()));
        HM.put("Manufacturer_ID", Integer.toString(this.getManufacturer_Id()));
        HM.put("Product_Code", this.getProduct_Code());
        HM.put("Quantity_on_hand", Integer.toString(this.getQuantity_on_Hand()));
        HM.put("markup", Float.toString(this.getMarkup()));
        HM.put("available", Boolean.toString(this.getAvailable()));
        HM.put("Description", this.getDescription());

        return HM;

    }
}
