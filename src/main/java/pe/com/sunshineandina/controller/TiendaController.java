/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.sunshineandina.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pe.com.sunshineandina.dto.CategoriaTO;
import pe.com.sunshineandina.dto.ProductoTO;
import pe.com.sunshineandina.service.CategoriaService;
import pe.com.sunshineandina.service.ProductoService;
import pe.com.sunshineandina.util.Constantes;

/**
 *
 * @author alonsorn
 */
@Controller
@RequestMapping("/tienda")
public class TiendaController {
    
    @Autowired
    private ProductoService productoService;
  
    @Autowired
    private CategoriaService categoriaService;
            
    @RequestMapping(value = "/productos", method = RequestMethod.GET)
    public String listaProductosVenta(Model model){
        /* Hallamos todas las categorias para el combo box */
        List<CategoriaTO> lstCategorias = categoriaService.findAllCategorias();
        model.addAttribute("lstCategorias",lstCategorias);
        
        /* Hallamos la lista de productos paginados */
        List<ProductoTO> lstProductos = productoService.findPaginado(Constantes.INICIO_PRODUCTOS_POR_PAGINA_POR_DEFECTO);
        model.addAttribute("lstProductos", lstProductos);
        
        /* Nro de paginas y cantidad de productos*/

        return "cliente/listaProductos";
    }
    
    @RequestMapping(value = "/productos/{idProducto}", method = RequestMethod.GET)
    @ResponseBody
    public ProductoTO detalleProducto(@PathVariable(name = "idProducto") int idProducto){
        ProductoTO producto = productoService.findProductoById(idProducto);
        
        ProductoTO productoJson = new ProductoTO();
        productoJson.setCategoria(new CategoriaTO());
        productoJson.getCategoria().setNombreCategoria(producto.getCategoria().getNombreCategoria());
        productoJson.setNombreProducto(producto.getNombreProducto());
        productoJson.setDescripcionProducto(producto.getDescripcionProducto());
        
        return productoJson;
    }
}