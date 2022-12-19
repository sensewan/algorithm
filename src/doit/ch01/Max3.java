package doit.ch01;

import java.util.Scanner;

public class Max3 {

    public static void main(String[] args) {

//        Scanner stdIn = new Scanner(System.in);
//
//        System.out.println("세 정수의 최댓값을 구합니다.");
//
//        System.out.println("a의 값 : "); int a = stdIn.nextInt();
//        System.out.println("b의 값 : "); int b = stdIn.nextInt();
//        System.out.println("c의 값 : "); int c = stdIn.nextInt();
//
//        int max = a;
//
//        if (b > max) max = b;
//        if (c > max) max = c;
//
//        System.out.println("최댓값은 " + max + "입니다.");

        System.out.println("-----------------");
        System.out.println(max3(4,1,5));
        System.out.println(max4(6,1,5, 2));

        System.out.println("-----------------------");
        System.out.println(min3(3, 2,4));

    }


    static int max3(int a, int b, int c) {
        int max = a;
        if (b > max) max = b;
        if (c > max) max = c;

        return max;
    }

    static int max4(int a, int b, int c, int d) {
        int max = a;
        if (b > max) max = b;
        if (c > max) max = c;
        if (d > max) max = d;

        return max;
    }


    static int min3(int a, int b, int c) {
        int min = a;
        if (b < min) min = b;
        if (c < min) min = c;
        return min;
    }

}

