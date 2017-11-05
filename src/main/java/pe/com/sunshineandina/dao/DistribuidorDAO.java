/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.sunshineandina.dao;

import java.util.List;
import pe.com.sunshineandina.dto.DistribuidorTO;

/**
 *
 * @author alonsorn
 */
public interface DistribuidorDAO {
    
    DistribuidorTO findById(int id);
    
    void save(DistribuidorTO distribuidor);
    
    DistribuidorTO findByCodigoDistribuidor(String codigoDistribuidor);
}