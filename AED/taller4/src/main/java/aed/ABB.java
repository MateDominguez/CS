package aed;
// elem1.compareTo(elem2) devuelve un entero. Si es mayor a 0, entonces elem1 > elem2


public class ABB<T extends Comparable<T>> implements Conjunto<T> {
    // Agregar atributos privados del Conjunto
    Nodo root;
    int size;

    private class Nodo {
        // Agregar atributos privados del Nodo
        T value;
        Nodo father;
        Nodo left;
        Nodo right;

        // Crear Constructor del nodo
        Nodo(T v) {
            value = v;
            father = null;
            left = null;
            right = null;
        }
    }

    public ABB() {
        root = null;
        size = 0;
    }

    public int cardinal() {
        return size;
    }

    public T minimo(){
        T min = null;
        Nodo current = root;
        while (current != null) {
            min = current.value;
            current = current.left;
        } return min;    
    }

    public T maximo(){
        T max = null;
        Nodo current = root;
        while (current != null) {
            max = current.value;
            current = current.right;
        } return max;
    }

    public void insertar(T elem){
        if (root == null) {
            root = new Nodo(elem);
            size++;
        } else if (!pertenece(elem)) {
            Nodo current = root;
            boolean endpoint = false; 
            while (!endpoint) {
                if (current.value.compareTo(elem) < 0 && current.right != null) {
                    current = current.right;
                } else if (current.value.compareTo(elem) < 0 && current.right == null) {
                    current.right = new Nodo(elem);
                    current.right.father = current;
                    endpoint = true;
                } else if (current.value.compareTo(elem) > 0 && current.left != null) {
                    current = current.left;
                } else {
                    current.left = new Nodo(elem);
                    current.left.father = current;
                    endpoint = true;
                }
            } size++;
        }
    }

    public boolean pertenece(T elem){
        Nodo current = root;
        while (current != null) {
            if (current.value.compareTo(elem) == 0) {
                return true;
            } else if (current.value.compareTo(elem) < 0) {
                current = current.right;
            } else {
                current = current.left;

            }
        } return false;
    }

    public void eliminar(T elem){
        if (pertenece(elem)) {
            Nodo current = root;
            while (current.value.compareTo(elem) != 0) {
                if (current.value.compareTo(elem) < 0) {
                    current = current.right;
                } else {
                    current = current.left;
                }
            } if (current.left == null && current.right == null) {
                if (current != root) {
                    if (current.father.left == current) {
                        current.father.left = null;
                    } else {
                        current.father.right = null;
                    }    
                }
                else {
                    root = null;
                }
            } else if (current.left != null && current.right == null) {
                current.left.father = current.father;
                if (current != root) {
                    if (current.father.left == current) {
                        current.father.left = current.left;    
                    } else {
                        current.father.right = current.left;
                    }
                } else {
                    root = current.left;
                }
            } else if (current.left == null && current.right != null) {
                current.right.father = current.father;
                if (current != root) {
                    if (current.father.left == current) {
                        current.father.left = current.right;    
                    } else {
                        current.father.right = current.right;
                    }
                } else {
                    root = current.right;
                }
            } else if (current.left != null && current.right != null) {
                Nodo replace = current.left;
                while (replace.right != null) {
                    replace = replace.right;
                }
                if (replace.left != null) {
                    replace.left.father = replace.father;
                } if (replace.father == current) {
                    replace.father.left = replace.left;
                } else {
                    replace.father.right = replace.left;
                }
                current.value = replace.value;
            } size--;
        }
    }

    public String toString(){
        ABB_Iterador iterador = new ABB_Iterador();
        if (size == 0) {
            return "{}";
        } else {
            String res = "{";
            while (iterador.haySiguiente()) {
                res = res + iterador.siguiente() + ",";
            } return res + iterador.siguiente() + "}";   
        }
    }

    private class ABB_Iterador implements Iterador<T> {
        private Nodo _actual;

        public ABB_Iterador() {
            _actual = root;
            if (root != null) {
                while (_actual.left != null) {
                    _actual = _actual.left;
                }
            }
        }

        public boolean haySiguiente() {            
            return _actual.value.compareTo(maximo()) < 0;
        }
    
        public T siguiente() {
            T res = _actual.value;
            if (haySiguiente()) {
                if (_actual.right != null) {
                    _actual = _actual.right;
                    while (_actual.left != null) {
                        _actual = _actual.left;
                    }
                } else {
                    if (_actual.father != null) {
                        _actual = _actual.father;
                        while (_actual.father != null && _actual.value.compareTo(res) < 0) {
                            _actual = _actual.father;
                        }
                    }
                    
                } 
            } return res;
        }
    }

    public Iterador<T> iterador() {
        return new ABB_Iterador();
    }

}
