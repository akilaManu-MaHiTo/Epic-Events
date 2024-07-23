package com.model.plan;



public class Birthday extends EventPlan {
    
    private int age;

    public Birthday(String firstName, String lastName, String date, int age) {
        super(firstName, lastName, date);
        this.age = age;
    }

    /**
     * @return the age
     */
    public int getAge() {
        return age;
    }

    /**
     * @param age the age to set
     */
    public void setAge(int age) {
        this.age = age;
    }
}