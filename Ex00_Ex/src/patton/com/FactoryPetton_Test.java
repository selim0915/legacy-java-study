package patton.com;

interface Animal {
    void animalPrint();
}

class AnimalInfo { //인터페이스 구체화
    public static Animal animalInfo(String animalName){
        if (animalName == null) {
            System.out.println("동물을 입력해주세요.");
        }
        
        if (animalName.equals("소")) {
            return new Cow();
        }else if (animalName.equals("고양이")) {
            return new Cat();
        }else{
            return null;
        }
    }
}

class Cat implements Animal {
    public void animalPrint() {
        System.out.println("고양이 다리 4개");
    }
}

class Cow implements Animal {
    public void animalPrint() {
        System.out.println("소 다리 4개");
    }
}

public class FactoryPetton_Test {

	public static void main(String[] args) {
		Animal a1 = AnimalInfo.animalInfo("소"); //new 연산자를 잘 못 사용할 경우 대비
		a1.animalPrint();
		Animal a2 = AnimalInfo.animalInfo("고양이");
		a2.animalPrint();
	}

}
