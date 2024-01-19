class Cat {
    private boolean collarStatus = false;
    public boolean isCollarStatus() {
        return collarStatus;
    }
    public void setCollarStatus(boolean status) {
        collarStatus = status;
    }
}

class ByReference {
    static void adopt(Cat cat) {
        System.out.println("Old value of \"collarStatus\" in \"adopt\" method is:" + cat.isCollarStatus());
        cat.setCollarStatus(true);
        System.out.println("New value of \"collarStatus\" in \"adopt\" method is:" + cat.isCollarStatus());
    }
    public static void main(String[] args) {
        Cat kitty = new Cat();
        System.out.println("Old value of \"collarStatus\" in \"main\" method is:" + kitty.isCollarStatus());
        adopt(kitty);
        System.out.println("New value of \"collarStatus\" in \"main\" method is:" + kitty.isCollarStatus());
    }
}