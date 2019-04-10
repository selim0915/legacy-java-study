package kr.or.bit;


/*
* 영화를 찍을 때 반드시 영화의 제목 장르, 배우이름, 감독이름, 개봉년도, 영화제목이 들어가야 함. => 필드생성
* 장르, 배우이름, 감독이름, 개봉년도, 영화제목은 수정할 수 없다. => setter생성x
* 영화에 들어간 정보를 한번에 출력할 수 있는 기능이 있어야 한다. =>info메서드 생성
* 영화 정보는 각각 정보를 출력할 수 있다. =>getter생성o
*/

public class Movie {
	private String moviename;
	private String Genre;
	private String actor;
	private String director;
	private String date;
	
	public Movie(String moviename, String genre, String actor, String director, String date) {
		this.moviename = moviename;
		this.Genre = genre;
		this.actor = actor;
		this.director = director;
		this.date = date;
	}
	
	
	public String getMoviename() {
		return moviename;
	}
	public String getGenre() {
		return Genre;
	}
	public String getActor() {
		return actor;
	}
	public String getDirector() {
		return director;
	}
	public String getDate() {
		return date;
	}
	
	public void movieInfo() {
		System.out.println("제목: " + moviename);
		System.out.println("장르: " + Genre);
		System.out.println("배우이름: " + actor);
		System.out.println("감독이름: " + director);
		System.out.println("개봉날짜: " + date);
	}
	
}
