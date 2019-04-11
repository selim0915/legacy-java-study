package cal.ex;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

import javax.xml.crypto.Data;

public class Cal {
	private int num1;
	private int num2;
	private String op;
	private Scanner sc;
	private Map<String, String> map;
	private Map<String, String> map2;
	private String anwser;
	private int score;
	private String qu;
	private SimpleDateFormat sd;

	Cal() {
		sc = new Scanner(System.in);
		map = new HashMap<String, String>();
		map2 = new HashMap<String, String>();
		score = 0;
		sd = new SimpleDateFormat("HH:mm:ss");
	}

	// 메뉴
	public void menu() throws IOException {
		while (true) {
			
			System.out.println("1. 문제풀기");
			System.out.println("2. 풀었던 문제 보기");
			System.out.println("3. 프로그램 종료");
			String menu = sc.nextLine();
			
			switch (menu) {
			case "1":
				playQuiz();
				break;
			case "2":
				printFile();
				break;
			case "3":
				System.exit(0);
			default:
				System.out.println("다시입력해주면..");
				break;
			}
		}
	}

	// <Map>안에 문제 넣고, 문제 나옴
	public void putQuiz() {
		map.put("1+1", "2");
		map.put("2+2", "4");
		map.put("3+3", "6");
		map.put("4+4", "8");
	}

	// 문제풀기, 결과출력
	public void playQuiz() throws IOException {
		putQuiz();

		Set<String> set = map.keySet();
		List<String> li = new ArrayList<String>(set);

		Collections.sort(li);
		Iterator<String> it = li.iterator();

		while (it.hasNext()) {
			qu = it.next();
			System.out.println(qu);

			System.out.println("당신의 정답은? ");
			anwser = sc.nextLine();
			map2.put(qu, anwser);

			if (map.get(qu).equals(anwser)) {
				System.out.println("정답입니다.");
				score++;
			} else {
				System.out.println("틀렸습니다.");
			}
		}

		System.out.println("총점수는 " + score + "/" + map.size() + "점");
		System.out.println();
		
		openFile();
	}

	// 결과를 파일로 저장하는 기능
	public void openFile() throws IOException {
		Date time =new Date();
		String ti =sd.format(time);
		
		
		File file = new File("C:\\temp\\quiz");
		file.mkdirs();

		PrintWriter pw = new PrintWriter(file+"\\0317.txt");
		BufferedWriter br = new BufferedWriter(pw);

		br.write("start!");

		Iterator<String> set = map.keySet().iterator();
		while (set.hasNext()) {
			qu = set.next();

			br.newLine();
			br.write(ti+"   ");
			br.write("질문 :" + qu + " 정답: " + map.get(qu) + " => 당신의 답: " + anwser);
		}

		br.newLine();
		br.write("end!");

		br.close();
		pw.close();

		System.out.println("기록이 저장되었습니다.");
	}

	// 결과를 불러오는 기능
	public void printFile() throws IOException {
		System.out.println("콘솔창에 불러와지나..");

		Map<String, String> map2 = null;
		Set<String> set2 = map2.keySet();
		
		for(String val :  set2) {
			System.out.println(val);
		}
	}

	public static void main(String[] args) {
		Cal cal = new Cal();
		try {
			cal.menu();
		} catch (IOException e) {
			System.out.println("파일 예외: " + e.getMessage());
			e.printStackTrace();
		}
	}
}
