/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.sunshineandina.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import pe.com.sunshineandina.dao.AbstractDAO;
import pe.com.sunshineandina.dao.UsuarioDAO;
import pe.com.sunshineandina.dto.UsuarioTO;

/**
 *
 * @author alonsorn
 */
@Repository("usuarioDao")
public class UsuarioDAOImpl extends AbstractDAO<Integer, UsuarioTO> implements UsuarioDAO{

    @Override
    public UsuarioTO findById(int id) {
        return getPorPk(id);
    }

    @Override
    public void saveUsuario(UsuarioTO usuario) {
        persist(usuario);
    }

    @Override
    public UsuarioTO findByRegistro(String registro) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("registroUsuario", registro));
        return (UsuarioTO)criteria.uniqueResult();
    }
    
}
