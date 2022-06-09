package com.example.back.servicio;

import com.example.back.dto.CuentaDTO;
import com.example.back.modelo.Cuenta;
import com.example.back.repositorio.CuentaRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class CuentaServicio {

    @Autowired
    private transient CuentaRepositorio cuentaRepositorio;

    public List<CuentaDTO> listarCuenta(){
        List<CuentaDTO> respuesta = new ArrayList<>();
        List<Cuenta> cuentas = cuentaRepositorio.findAll();
        cuentas.forEach(cuenta -> {
            CuentaDTO cuentaDTO = new CuentaDTO(cuenta);
            respuesta.add(cuentaDTO);
        });

        return respuesta;
    }

    public CuentaDTO guardar(CuentaDTO cuenta){
        Cuenta cuentaGuardar = new Cuenta();
        cuentaGuardar.setNumeroCuenta(cuenta.getNumeroCuenta());
        cuentaGuardar.setSaldo(cuenta.getSaldo());
        cuentaGuardar.setFechaApertura(new Date());
        cuentaRepositorio.save(cuentaGuardar);

        CuentaDTO respuesta = new CuentaDTO(cuentaGuardar);
        return respuesta;
    }

    public CuentaDTO obtenerCuentaPorId(Long id){
        Optional<Cuenta> cuenta = cuentaRepositorio.findById(id);
        return new CuentaDTO(cuenta.get());
    }


    public CuentaDTO actualizar(Long id, CuentaDTO cuenta){
        Optional<Cuenta> cuentaActualizar = cuentaRepositorio.findById(id);
        cuentaActualizar.get().setNumeroCuenta(cuenta.getNumeroCuenta());
        cuentaActualizar.get().setSaldo(cuenta.getSaldo());
        cuentaRepositorio.save(cuentaActualizar.get());

        CuentaDTO respuesta = new CuentaDTO(cuentaActualizar.get());
        return respuesta;
    }

    public void eliminar(Long id){
        Optional<Cuenta> cuenta = cuentaRepositorio.findById(id);
        cuentaRepositorio.delete(cuenta.get());
    }

    public List<CuentaDTO> filtrarCuentas(Long numeroCuenta){
        List<CuentaDTO> respuesta = new ArrayList<>();
        Optional<Cuenta> cuenta = cuentaRepositorio.filtrarCuentas(numeroCuenta);
        if (cuenta.isPresent()){
            CuentaDTO cuentaDTO = new CuentaDTO(cuenta.get());
            respuesta.add(cuentaDTO);
        }
        return respuesta;
    }



}
