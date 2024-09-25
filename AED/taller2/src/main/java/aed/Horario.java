package aed;

public class Horario {
    private int minutos;
    private int hora;

    public Horario(int hora, int minutos) {
        this.minutos = minutos;
        this.hora = hora;
    }

    public int hora() {
        return hora;
    }

    public int minutos() {
        return minutos;
    }

    @Override
    public String toString() {
        return String.format("%d:%d", hora, minutos);
    }

    @Override
    public boolean equals(Object otro) {
        if (otro == null || otro.getClass() != this.getClass()) {
            return false;
        }

        Horario otroHorario = (Horario) otro;

        return minutos == otroHorario.minutos && hora == otroHorario.hora;
    }

}
