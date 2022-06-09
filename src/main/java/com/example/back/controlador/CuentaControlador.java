package com.example.back.controlador;

import com.example.back.dto.CuentaDTO;
import com.example.back.servicio.CuentaServicio;
import com.sun.istack.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
@RestController
@RequestMapping({"/back/cuentas"})
public class CuentaControlador {

    @Autowired
    private transient CuentaServicio cuentaServicio;

    @GetMapping()
    public List<CuentaDTO> listar(){
        return cuentaServicio.listarCuenta();
    }

    @GetMapping("/{id}")
    public CuentaDTO obtenerCuentaPorId(@PathVariable("id") Long id){
        return cuentaServicio.obtenerCuentaPorId(id);
    }

    @PostMapping()
    public CuentaDTO guardar(@RequestBody CuentaDTO cuenta){
        return cuentaServicio.guardar(cuenta);
    }

    @PutMapping(path = {"/{id}"})
    public CuentaDTO actualizar(@RequestBody CuentaDTO cuenta,@PathVariable("id") Long id){
        return cuentaServicio.actualizar(id, cuenta);
    }

    @DeleteMapping(path = {"/{id}"})
    public void eliminar(@PathVariable("id") Long id){
        cuentaServicio.eliminar(id);
    }

    @GetMapping("/cuenta")
    public List<CuentaDTO> listar(@RequestParam @NotNull() Long numeroCuenta){
        return cuentaServicio.filtrarCuentas(numeroCuenta);
    }
}
