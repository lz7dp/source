package com.company;

class MyClass {
    public static void main(String[] args) {
        Vehicle v1 = new Vehicle();
        Vehicle v2 = new Vehicle();
        v1.setColor("Red");
        v2.horn();
        System.out.println(v1.getColor());
    }
}
