package beans;


public class Product {
	private int id;
	private String name;
	private float rate;
	private float price;
	private FichTech ficheTech;
	private String image;
	private int quantity;
	
	public Product() {
		super();
	}

	
	public Product(int id, String name, float rate, float price, FichTech ficheTech, String image, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.rate = rate;
		this.price = price;
		this.ficheTech = ficheTech;
		this.image = image;
		this.quantity = quantity;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public FichTech getFicheTech() {
		return ficheTech;
	}
	public void setFicheTech(FichTech ficheTech) {
		this.ficheTech = ficheTech;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	

}
