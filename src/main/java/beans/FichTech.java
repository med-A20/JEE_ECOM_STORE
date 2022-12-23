package beans;

public class FichTech {
	private String os;
	private String display;
	private String cam;
	private String battery;
	private String processor;
	private String memory;
	public FichTech() {
		super();
	}
	public FichTech(String os, String display, String cam, String battery, String processor, String memory) {
		super();
		this.os = os;
		this.display = display;
		this.cam = cam;
		this.battery = battery;
		this.processor = processor;
		this.memory = memory;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	public String getCam() {
		return cam;
	}
	public void setCam(String cam) {
		this.cam = cam;
	}
	public String getBattery() {
		return battery;
	}
	public void setBattery(String battery) {
		this.battery = battery;
	}
	public String getProcessor() {
		return processor;
	}
	public void setProcessor(String processor) {
		this.processor = processor;
	}
	public String getMemory() {
		return memory;
	}
	public void setMemory(String memory) {
		this.memory = memory;
	}
	
}
