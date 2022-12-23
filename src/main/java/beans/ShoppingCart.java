package beans;

import java.util.ArrayList;

public class ShoppingCart {
	private ArrayList<Product> products;
	private  double totalPrice;
	
	public ShoppingCart() {
		super();
		setTotalPrice(0);
		products = new ArrayList<Product>();
	}

	public ArrayList<Product> getProducts() {
		return products;
	}

	public void setProducts(ArrayList<Product> products) {
		this.products = products;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public Boolean addItem(Product product) {
		try {
			this.products.add(product);
			this.totalPrice = this.totalPrice + product.getPrice();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	public static void main(String ...args) {
		ShoppingCart cart = new ShoppingCart();
		
		cart.addItem(new Product(2, "", 0.9F, 0.5f, null, "test", 66));
		cart.addItem(new Product(2, "", 0.9F, 0.5f, null, "test", 66));
		
		System.out.println(cart.getProducts().size());
	}

}
