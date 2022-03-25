package models;

public class Medication {
    private String name;
    private Double amount;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public static Medication create(String name, Double amount){
        Medication meds = new Medication();
        meds.setName(name);
        meds.setAmount(amount);
        return meds;
    }
}
