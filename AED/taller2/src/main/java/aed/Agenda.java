package aed;

public class Agenda {
    private Recordatorio[] agenda;
    private Fecha fechaActual;

    public Agenda(Fecha fechaActual) {
        agenda = new  Recordatorio[0];
        this.fechaActual = new Fecha(fechaActual.dia(), fechaActual.mes());
    }

    public void agregarRecordatorio(Recordatorio recordatorio) {
        Recordatorio[] agendaNueva = new Recordatorio[agenda.length + 1];
        for (int i = 0; i < agenda.length; i++) {
            agendaNueva[i] = agenda[i];
        }
        agendaNueva[agendaNueva.length - 1] = recordatorio;
        agenda = agendaNueva;
    }

    @Override
    public String toString() {
        String res = fechaActual.toString() + "\n=====\n";
        for (Recordatorio recordatorio : agenda) {
            if (recordatorio.fecha().equals(fechaActual)) {
                res = res + recordatorio.toString() + "\n"; 
            }
        }
        return res;
    }

    public void incrementarDia() {
        fechaActual.incrementarDia();
    }

    public Fecha fechaActual() {
        return new Fecha(fechaActual.dia(), fechaActual.mes());
    }

}
