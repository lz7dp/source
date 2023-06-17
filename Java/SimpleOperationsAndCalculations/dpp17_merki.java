package com.dpp;

import java.util.Scanner;

public class dpp17_merki {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        Double measure1 = Double.parseDouble(scanner.nextLine());
        Double result1 = 0.0;
        String unit1 = scanner.nextLine();
        String unit2 = scanner.nextLine();

        if (unit1.equals("m")){
            if(unit2.equals("mm")){
                result1 = (measure1 * 1000);
            } else if(unit2.equals("cm")){
                result1 = (measure1 * 100);
            } else if (unit2.equals("mi")){
                result1 = (measure1 * 0.000621371192);
            } else if (unit2.equals("in")){
                result1 = (measure1 * 39.3700787);
            } else if (unit2.equals("km")){
                result1 = (measure1 * 0.001);
            } else if (unit2.equals("ft")){
                result1 = (measure1 * 3.2808399);
            } else if (unit2.equals("yd")){
                result1 = (measure1 * 1.0936133);
            } else if (unit2.equals("m")){
                result1 = (measure1 * 1);
            }
        }

        if (unit1.equals("mm")){
            if(unit2.equals("m")){
                result1 = (measure1 / 1000);
            } else if(unit2.equals("cm")){
                result1 = (measure1 * 100 / 1000);
            } else if (unit2.equals("mi")){
                result1 = (measure1 * 0.000621371192 / 1000);
            } else if (unit2.equals("in")){
                result1 = (measure1 * 39.3700787 / 1000);
            } else if (unit2.equals("km")){
                result1 = (measure1 * 0.001 / 1000);
            } else if (unit2.equals("ft")){
                result1 = (measure1 * 3.2808399 / 1000);
            } else if (unit2.equals("yd")){
                result1 = (measure1 * 1.0936133 / 1000);
            } else if (unit2.equals("mm")){
                result1 = (measure1 * 1);
            }
        }

        if (unit1.equals("cm")){
            if(unit2.equals("mm")){
                result1 = (measure1 * 1000 / 100);
            } else if(unit2.equals("m")){
                result1 = (measure1 / 100);
            } else if (unit2.equals("mi")){
                result1 = (measure1 * 0.000621371192 / 100);
            } else if (unit2.equals("in")){
                result1 = (measure1 * 39.3700787 / 100);
            } else if (unit2.equals("km")){
                result1 = (measure1 * 0.001 / 100);
            } else if (unit2.equals("ft")){
                result1 = (measure1 * 3.2808399 / 100);
            } else if (unit2.equals("yd")){
                result1 = (measure1 * 1.0936133 / 100);
            } else if (unit2.equals("cm")){
                result1 = (measure1 * 1);
            }
        }

        if (unit1.equals("mi")){
            if(unit2.equals("mm")){
                result1 = (measure1 * 1000 / 0.000621371192);
            } else if(unit2.equals("cm")){
                result1 = (measure1 * 100 / 0.000621371192);
            } else if (unit2.equals("m")){
                result1 = (measure1 / 0.000621371192);
            } else if (unit2.equals("in")){
                result1 = (measure1 * 39.3700787 / 0.000621371192);
            } else if (unit2.equals("km")){
                result1 = (measure1 * 0.001 / 0.000621371192);
            } else if (unit2.equals("ft")){
                result1 = (measure1 * 3.2808399 / 0.000621371192);
            } else if (unit2.equals("yd")){
                result1 = (measure1 * 1.0936133 / 0.000621371192);
            } else if (unit2.equals("mi")){
                result1 = (measure1 * 1);
            }
        }

        if (unit1.equals("in")){
            if(unit2.equals("mm")){
                result1 = (measure1 * 1000 / 39.3700787);
            } else if(unit2.equals("cm")){
                result1 = (measure1 * 100 / 39.3700787);
            } else if (unit2.equals("mi")){
                result1 = (measure1 * 0.000621371192 / 39.3700787);
            } else if (unit2.equals("m")){
                result1 = (measure1 / 39.3700787);
            } else if (unit2.equals("km")){
                result1 = (measure1 * 0.001 / 39.3700787);
            } else if (unit2.equals("ft")){
                result1 = (measure1 * 3.2808399 / 39.3700787);
            } else if (unit2.equals("yd")){
                result1 = (measure1 * 1.0936133 / 39.3700787);
            } else if (unit2.equals("in")){
                result1 = (measure1 * 1);
            }
        }

        if (unit1.equals("km")){
            if(unit2.equals("mm")){
                result1 = (measure1 * 1000 / 0.001);
            } else if(unit2.equals("cm")){
                result1 = (measure1 * 100 / 0.001);
            } else if (unit2.equals("mi")){
                result1 = (measure1 * 0.000621371192 / 0.001);
            } else if (unit2.equals("in")){
                result1 = (measure1 * 39.3700787 / 0.001);
            } else if (unit2.equals("m")){
                result1 = (measure1 / 0.001);
            } else if (unit2.equals("ft")){
                result1 = (measure1 * 3.2808399 / 0.001);
            } else if (unit2.equals("yd")){
                result1 = (measure1 * 1.0936133 / 0.001);
            } else if (unit2.equals("km")){
                result1 = (measure1 * 1);
            }
        }

        if (unit1.equals("ft")){
            if(unit2.equals("mm")){
                result1 = (measure1 * 1000 / 3.2808399);
            } else if(unit2.equals("cm")){
                result1 = (measure1 * 100 / 3.2808399);
            } else if (unit2.equals("mi")){
                result1 = (measure1 * 0.000621371192 / 3.2808399);
            } else if (unit2.equals("in")){
                result1 = (measure1 * 39.3700787 / 3.2808399);
            } else if (unit2.equals("km")){
                result1 = (measure1 * 0.001 / 3.2808399);
            } else if (unit2.equals("m")){
                result1 = (measure1 / 3.2808399);
            } else if (unit2.equals("yd")){
                result1 = (measure1 * 1.0936133 / 3.2808399);
            } else if (unit2.equals("ft")){
                result1 = (measure1 * 1);
            }
        }

        if (unit1.equals("yd")){
            if(unit2.equals("mm")){
                result1 = (measure1 * 1000 / 1.0936133);
            } else if(unit2.equals("cm")){
                result1 = (measure1 * 100 / 1.0936133);
            } else if (unit2.equals("mi")){
                result1 = (measure1 * 0.000621371192 / 1.0936133);
            } else if (unit2.equals("in")){
                result1 = (measure1 * 39.3700787 / 1.0936133);
            } else if (unit2.equals("km")){
                result1 = (measure1 * 0.001 / 1.0936133);
            } else if (unit2.equals("ft")){
                result1 = (measure1 * 3.2808399 / 1.0936133);
            } else if (unit2.equals("m")){
                result1 = (measure1 / 1.0936133);
            } else if (unit2.equals("yd")){
                result1 = (measure1 * 1);
            }
        }
        System.out.printf("%.8f", result1);
    }
}
