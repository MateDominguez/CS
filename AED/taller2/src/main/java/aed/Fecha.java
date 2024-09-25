package aed;

public class Fecha {
    private int dia;
    private int mes;

    public Fecha(int dia, int mes) {
        this.dia = dia;
        this.mes = mes;
    }

    public Fecha(Fecha fecha) {
        dia = fecha.dia;
        mes = fecha.mes;
    }

    public Integer dia() {
        return dia;
    }

    public Integer mes() {
        return mes;
    }

    @Override
    public String toString() {
        return String.format("%d/%d", dia, mes);
    }

    @Override
    public boolean equals(Object otra) {
        if (otra == null || otra.getClass() != this.getClass()) {
            return false;
        }
        Fecha otraFecha = (Fecha) otra;
        return dia == otraFecha.dia && mes == otraFecha.mes;
    }

    public void incrementarDia() {
        if (diasEnMes(mes) == dia) {
            dia = 1;
            if (mes == 12) {
                mes = 1;
            } else {
                mes++;
            }
        } else {
            dia++;
        }
    }

    private int diasEnMes(int mes) {
        int dias[] = {
                // ene, feb, mar, abr, may, jun
                31, 28, 31, 30, 31, 30,
                // jul, ago, sep, oct, nov, dic
                31, 31, 30, 31, 30, 31
        };
        return dias[mes - 1];
    }

}
