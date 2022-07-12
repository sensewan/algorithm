package string;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;


/*
* 1. 리스트 초기화
* */

// 단어의 개수
public class String5622 {
    public static void main(String[] args) throws IOException {

//        전화를 걸고 싶은 번호가 있다면, 숫자를 하나를 누른 다음에 금속 핀이 있는 곳 까지 시계방향으로 돌려야 한다.
//        숫자를 하나 누르면 다이얼이 처음 위치로 돌아가고, 다음 숫자를 누르려면 다이얼을 처음 위치에서 다시 돌려야 한다.
//
//        숫자 1을 걸려면 총 2초가 필요하다. 1보다 큰 수를 거는데 걸리는 시간은 이보다 더 걸리며, 한 칸 옆에 있는 숫자를 걸기 위해선 1초씩 더 걸린다.
//
//        상근이의 할머니는 전화 번호를 각 숫자에 해당하는 문자로 외운다. 즉, 어떤 단어를 걸 때, 각 알파벳에 해당하는 숫자를 걸면 된다.
//        예를 들어, UNUCIC는 868242와 같다.
//        할머니가 외운 단어가 주어졌을 때, 이 전화를 걸기 위해서 필요한 최소 시간을 구하는 프로그램을 작성하시오.

//        첫째 줄에 알파벳 대문자로 이루어진 단어가 주어진다. 단어의 길이는 2보다 크거나 같고, 15보다 작거나 같다.

//        1, 2:ABC, 3:DEF, 4:GHI, 5:JKL, 6:MNO, 7:PQRS, 8:TUV, 9:WXYZ, 0

//        WA   ->  13
//        UNUCIC    ->  36



        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String a = br.readLine();

        List<String> dial = Arrays.asList("1", "2:ABC", "3:DEF", "4:GHI", "5:JKL", "6:MNO", "7:PQRS", "8:TUV", "9:WXYZ", "0");

        int time = 0;

        for(int i=0; i<a.length(); i++) {
            char first = a.charAt(i);

            aaa:
            for(int j=0; j<dial.size(); j++) {
                String item = dial.get(j);

                for(int t=0; t<item.length(); t++) {

                    if(first == item.charAt(t)) {
                        time += j + 2;
                        break aaa;
                    }
                }

            }
        }

        System.out.println(time);

        br.close();

    }
}
