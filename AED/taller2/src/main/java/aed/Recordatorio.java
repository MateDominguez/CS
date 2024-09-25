package aed;

public class Recordatorio {
    private String mensaje;
    private Fecha fecha;
    private Horario horario;

    public Recordatorio(String mensaje, Fecha fecha, Horario horario) {
        this.mensaje = mensaje;
        this.fecha = new Fecha(fecha.dia(),fecha.mes());
        this.horario = new Horario(horario.hora(), horario.minutos());
    }

    public Horario horario() {
        return new Horario(this.horario.hora(), this.horario.minutos());
    }

    public Fecha fecha() {
        return new Fecha(this.fecha.dia(),this.fecha.mes());
    }

    public String mensaje() {
        return this.mensaje;
    }

    @Override
    public String toString() {
        return String.format("%s @ %s %s", mensaje, fecha.toString(), horario.toString());
    }

    @Override
    public boolean equals(Object otro) {
        if (otro == null || otro.getClass() != this.getClass()) {
            return false;
        }

        Recordatorio otroRecordatorio = (Recordatorio) otro;

        return mensaje.equals(otroRecordatorio.mensaje) && fecha.equals(otroRecordatorio.fecha) && horario.equals(otroRecordatorio.horario);
    }

}
