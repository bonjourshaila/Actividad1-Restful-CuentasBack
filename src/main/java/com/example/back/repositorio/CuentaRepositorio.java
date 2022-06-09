package com.example.back.repositorio;
import com.example.back.modelo.Cuenta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface CuentaRepositorio extends JpaRepository<Cuenta, Long> {


    @Query("SELECT c FROM Cuenta c " +
            "WHERE  c.numeroCuenta = ?1")
    Optional<Cuenta> filtrarCuentas(Long numeroCuenta);


}
