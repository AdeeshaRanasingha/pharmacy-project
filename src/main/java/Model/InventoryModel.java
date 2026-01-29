package Model;

public class InventoryModel {
	private int medicineId;
	private String medicineName;
	private String description;
	private String category;
	private int quantity;
	private int unitPrice;
	private String prescriptionRequired;
	private String expiryDate;
	private String addedDate;
	public int getMedicineId() {
		return medicineId;
	}
	public void setMedicineId(int medicineId) {
		this.medicineId = medicineId;
	}
	public String getMedicineName() {
		return medicineName;
	}
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}
	public String getdescription() {
		return description;
	}
	public void setdescription(String code) {
		this.description = code;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getPrescriptionRequired() {
		return prescriptionRequired;
	}
	public void setPrescriptionRequired(String prescriptionRequired) {
		this.prescriptionRequired = prescriptionRequired;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getAddedDate() {
		return addedDate;
	}
	public void setAddedDate(String addedDate) {
		this.addedDate = addedDate;
	}
	
	

}
