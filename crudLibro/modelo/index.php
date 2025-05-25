<?php
class Modelo {
    private $db;
    private $datos;

    public function __construct() {
        try {
            $this->db = new PDO('mysql:host=localhost; dbname=Biblioteca', "root", "");
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Error de conexión: " . $e->getMessage());
        }
    }

    // Insertar un nuevo libro
    public function insertarLibro($codigo, $titulo, $isbn, $editorial, $paginas) {
        $sql = "INSERT INTO Libro (Codigo, Titulo, ISBN, Editorial, Paginas) VALUES (:codigo, :titulo, :isbn, :editorial, :paginas)";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([
            ':codigo' => $codigo,
            ':titulo' => $titulo,
            ':isbn' => $isbn,
            ':editorial' => $editorial,
            ':paginas' => $paginas
        ]);
    }

    // Mostrar libros según una condición
    public function mostrarLibros($condicion = "1") {
        $sql = "SELECT * FROM Libro WHERE $condicion";
        $res = $this->db->query($sql);
        return $res->fetchAll(PDO::FETCH_ASSOC);
    }

    // Actualizar un libro
    public function actualizarLibro($codigo, $data) {
        // $data debe ser un string como: "Titulo='Nuevo título', Paginas=300"
        $sql = "UPDATE Libro SET $data WHERE Codigo = :codigo";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([':codigo' => $codigo]);
    }

    // Eliminar un libro
    public function eliminarLibro($codigo) {
        $sql = "DELETE FROM Libro WHERE Codigo = :codigo";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([':codigo' => $codigo]);
    }
}
?>
