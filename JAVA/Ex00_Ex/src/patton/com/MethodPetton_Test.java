package patton.com;

abstract class Worker {
    protected abstract void doit();
}

class Designer extends Worker {
    @Override
    protected void doit() {
        System.out.println("디자이너는 디자인을 한다.");
    }
}

class Gamer extends Worker {
    @Override
    protected void doit(){
        System.out.println("열심히 껨질");
    }
}

public class MethodPetton_Test {

	public static void main(String[] args) {
		Worker designer = new Designer();
        designer.doit();
        Worker gamer = new Gamer();
        gamer.doit();
	}

}
