package aed;

public class ListaEnlazada<T> implements Secuencia<T> {
    private Nodo primero;
    private Nodo ultimo;
    private int longitud;

    private class Nodo {
        T valor;
        Nodo sig;
        Nodo prev;

        Nodo(T v) {
            valor = v;
        }
    }

    public ListaEnlazada() {
        primero = null;
        ultimo = null;
        longitud = 0;
    }

    public int longitud() {
        return longitud;
    }

    public void agregarAdelante(T elem) {
        Nodo nuevo = new Nodo(elem);
        if (longitud > 0) {
            primero.prev = nuevo;
        } else {
            ultimo = nuevo;
        }
        nuevo.sig = primero;
        primero = nuevo;
        longitud++;
    }

    public void agregarAtras(T elem) {
        Nodo nuevo = new Nodo(elem);
        if (longitud > 0) {
            ultimo.sig = nuevo;
        } else {
            primero = nuevo;
        }
        nuevo.prev = ultimo;
        ultimo = nuevo;
        longitud++;
        }

    public T obtener(int i) {
        Nodo actual = primero;
        int posicion = 0;
        while(posicion < i) {
            actual = actual.sig;
            posicion++;
        }
        return actual.valor;
    }

    public void eliminar(int i) {
        Nodo actual = primero;

        if (i == 0 && longitud > 1) {
            primero = primero.sig;
            primero.prev = null;
        } else if (i == longitud - 1 && longitud > 1) {
            ultimo = ultimo.prev;
            ultimo.sig = null;
        } else if (longitud == 1) {
            primero = null;
            ultimo = null;
        } else {
            int posicion = 0;
            while(posicion < i) {
                actual = actual.sig;
                posicion++;
            }
            actual.sig.prev = actual.prev;
            actual.prev.sig = actual.sig;
        }
        longitud--;
    }

    public void modificarPosicion(int indice, T elem) {
        Nodo actual = primero;
        int posicion = 0;
        while(posicion < indice) {
            actual = actual.sig;
            posicion++;
        } 
        actual.valor = elem; 
    }

    public ListaEnlazada(ListaEnlazada<T> lista) {
        int posicion = 0;
        while(posicion < lista.longitud()) {
            agregarAtras(lista.obtener(posicion));
            posicion++;
        } 
    }
    
    @Override
    public String toString() {
        if (longitud() == 0) {
            return "[]";
        }
        String res = "[" + obtener(0);
        int posicion = 1;
        while(posicion < longitud()) {
            res = res + ", " + obtener(posicion);
            posicion++;
        } res = res + "]";
        return res;
    }

    private class ListaIterador implements Iterador<T> {
        int indice;

        ListaIterador() {
            indice = 0;
        }

        public boolean haySiguiente() {
            return indice < longitud;
        }
        
        public boolean hayAnterior() {
            return indice > 0;
        }

        public T siguiente() {
            T res = obtener(indice);
            indice++;
            return res;
        }  

        public T anterior() {
            indice--;
            return obtener(indice);
        }
    }

    public Iterador<T> iterador() {
        return new ListaIterador();
    }
}
