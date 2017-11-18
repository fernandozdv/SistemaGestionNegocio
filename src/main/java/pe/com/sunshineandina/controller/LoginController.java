/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.sunshineandina.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pe.com.sunshineandina.dto.PerfilTO;
import pe.com.sunshineandina.dto.UsuarioTO;
import pe.com.sunshineandina.service.LoginService;
import pe.com.sunshineandina.service.PruebaService;
import pe.com.sunshineandina.util.Constantes;
import pe.com.sunshineandina.util.HashPassword;

/**
 *
 * @author alonsorn
 */
@Controller
@RequestMapping("/")
public class LoginController {
    
    @Autowired
    private LoginService loginService;
    
    @RequestMapping("/")
    public String index(){
        
        return "general/login";
    }
    
    @RequestMapping("/prueba")
    public String prueba(){
        String hex = HashPassword.hashPassword("admin");
        
        System.out.println(hex);
        
        hex = HashPassword.hashPassword("prueba");
        System.out.println(hex);
        
        return "index";
    }
    
    @RequestMapping("/login")
    public String login(
            @RequestParam("usuario") String usuario,
            @RequestParam("password") String password,
            HttpSession session){
        
        /* Usuario a comprobar si es el autentico*/
        UsuarioTO usuarioPosible = new UsuarioTO();
        usuarioPosible.setRegistroUsuario(usuario);
        usuarioPosible.setPassUsuario(password);
        
        /* Verificamos si es autentico*/
        Map<String, Object> mapResultado = loginService.autenticacion(usuarioPosible);
        
        UsuarioTO usuarioReal = (UsuarioTO)mapResultado.get("usuario");
        
        /* Si no existe el usuario*/
        if(usuarioReal == null){
            return "redirect:/";
        }
        
        usuarioReal.setPerfiles(loginService.perfilesUsuario(usuarioReal));
        session.setAttribute("usuario", usuarioReal);
        
        PerfilTO perfil = usuarioReal.getPerfiles().get(0);
        
        /* DEPENDIENDO DEL PERFIL, LLEVAMOS A LA PAGINA DE INICIO*/
        switch(perfil.getCodigoPerfil()){  
            case Constantes.PERFIL_ENCARGADO_INV:
                return "inventario/lista_productos";
            case Constantes.PERFIL_ENCARGADO_ADM:
                return "admin/lista_usuarios";
            default:
                return "index";
        }
    }
}