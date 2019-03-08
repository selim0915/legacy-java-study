
import java.io.BufferedWriter;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeSet;

public class Ex00_Lotto {
	
	public static int count = 0;
	public static void main(String[] args) {

		// 날짜
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd a HH:mm");
		SimpleDateFormat sd2 = new SimpleDateFormat("MMdd");
		String strDate = sd.format(new Date());
		String strDate2 = sd2.format(new Date());

		try {
			String path = "C:\\Temp\\" + strDate2;
			File dir = new File(path);
			
			if (dir.exists()) {
				System.out.println("이미 존재하는 디렉토리입니다");
			} else {
				dir.mkdirs(); // mkdir():경로가 정확해야 만들어줌 mkdirs():경로가 없으면 부모경로까지 만들어줌
			}

			//PrintWriter pw = new PrintWriter(dir + "\\lotto.txt");
			PrintWriter pw = new PrintWriter(dir + "\\lotto.txt");
			BufferedWriter br = new BufferedWriter(pw);

			String user = "";
			String s = "";

			do {
				Scanner sc = new Scanner(System.in);
				System.out.println("1: 추첨, 2:중지");
				user = sc.nextLine();

				// 로또
				Set<Integer> lotto = new TreeSet<Integer>();
				for (int i = 0; lotto.size() < 6; i++) {
					lotto.add((int) (Math.random() * 45) + 1);
				}
				String num = lotto.toString();
				
				//writer
				br.write("****************************");
				br.newLine();
				br.write(strDate + " ");
				br.write(++count + "회차: " +num);
				br.newLine();
				
				//번호 추첨
				System.out.println(num);

			} while (!user.equals("2"));
			
			br.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

}
