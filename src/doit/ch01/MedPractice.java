package doit.ch01;

public class MedPractice {

    static int med3Practice(int a, int b, int c) {

        if (a >= b) {
            if (b >= c) {
                return b;
            } else if (a >= c) {
                return a;
            } else {
                return c;
            }
        } else if (a > c) {
            return a;
        } else if (b > c) {
            return c;
        } else {
            return b;
        }

    }


    public static void main(String[] args) {

        System.out.println("med3Practice(3,2,1) = " + med3Practice(3, 2, 1)); // a＞b＞c
        System.out.println("med3Practice(3,2,2) = " + med3Practice(3, 2, 2)); // a＞b＝c
        System.out.println("med3Practice(3,1,2) = " + med3Practice(3, 1, 2)); // a＞c＞b
        System.out.println("med3Practice(3,2,3) = " + med3Practice(3, 2, 3)); // a＝c＞b
        System.out.println("med3Practice(2,1,3) = " + med3Practice(2, 1, 3)); // c＞a＞b
        System.out.println("med3Practice(3,3,2) = " + med3Practice(3, 3, 2)); // a＝b＞c
        System.out.println("med3Practice(3,3,3) = " + med3Practice(3, 3, 3)); // a＝b＝c
        System.out.println("med3Practice(2,2,3) = " + med3Practice(2, 2, 3)); // c＞a＝b
        System.out.println("med3Practice(2,3,1) = " + med3Practice(2, 3, 1)); // b＞a＞c
        System.out.println("med3Practice(2,3,2) = " + med3Practice(2, 3, 2)); // b＞a＝c
        System.out.println("med3Practice(1,3,2) = " + med3Practice(1, 3, 2)); // b＞c＞a
        System.out.println("med3Practice(2,3,3) = " + med3Practice(2, 3, 3)); // b＝c＞a
        System.out.println("med3Practice(1,2,3) = " + med3Practice(1, 2, 3)); // c＞b＞a
    }

}