package aed;

class ArregloRedimensionableDeRecordatorios {
    private Recordatorio[] arreglo;

    public ArregloRedimensionableDeRecordatorios() {
        arreglo = new Recordatorio[0];
    }

    public int longitud() {
        return arreglo.length;
    }

    public void agregarAtras(Recordatorio i) {
        Recordatorio[] arregloNuevo = new Recordatorio[arreglo.length + 1];
        for (int j = 0; j < arreglo.length; j++) {
            arregloNuevo[j] = arreglo[j];
        }
        arregloNuevo[arregloNuevo.length - 1] = i;
        arreglo = arregloNuevo;
    }

    public Recordatorio obtener(int i) {
        return this.arreglo[i];
    }

    public void quitarAtras() {
        Recordatorio[] arregloNuevo = new Recordatorio[arreglo.length - 1];
        for (int i = 0; i < arregloNuevo.length; i++) {
            arregloNuevo[i] = arreglo[i];
        }
        arreglo = arregloNuevo;
    }

    public void modificarPosicion(int indice, Recordatorio valor) {
        arreglo[indice] = valor;
    }

    public ArregloRedimensionableDeRecordatorios(ArregloRedimensionableDeRecordatorios vector) {
        arreglo = new Recordatorio[vector.longitud()];
        for (int i = 0; i < vector.longitud(); i++) {
            arreglo[i] = new Recordatorio(vector.obtener(i).mensaje(), vector.obtener(i).fecha(), vector.obtener(i).horario());
        }
    }

    public ArregloRedimensionableDeRecordatorios copiar() {
        return new ArregloRedimensionableDeRecordatorios(this);
    }
}
