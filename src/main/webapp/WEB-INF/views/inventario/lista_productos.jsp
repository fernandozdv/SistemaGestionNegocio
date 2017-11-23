<%-- 
    Document   : lista_productos
    Created on : 01/11/2017, 07:31:50 PM
    Author     : FERNANDO
--%>

<%@page import="pe.com.sunshineandina.dto.CategoriaTO"%>
<%@page import="pe.com.sunshineandina.dto.ProductoTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../includes/headerInventario.jsp"%>


<c:set var="listaProductos" scope="session" value="${listaProductos}"/>

<div class="container">
    <div class="titulo">
        <h1 class="text-center">Productos</h1>
        <a href="${pageContext.request.contextPath}/inventario/nuevoProducto" class="btn btn-warning pull-right" id="add-producto-btn">Registrar un producto</a>
        <div class="clearfix"></div><hr>
    </div>
    <div class="row">
        <table class="table table-sm table-hover table-bordered">
            <thead class="thead-inverse thead-lg">
            <th></th>
            <th>Nombre</th>
            <th>Categoría</th>
            <th>Cantidad</th>
            <th>Precio</th>
            <th>Disponible</th>
            </thead>
            <tbody>
                <c:forEach items="${listaProductos}" var="producto">
                    <tr>
                        <td class="text-center icon">
                            <a href="${pageContext.request.contextPath}/inventario/nuevoProducto?edit=${producto.idProducto}" class="btn btn-sm"><span class="fa fa-pencil fa-2x"></span></a>
                            <c:if test="${producto.estadoProducto == 1}">
                                <button class="btn btn-sm btn-cambiar-estado-producto" data-idproducto="${producto.idProducto}">
                                    <span class="fa fa-times-circle fa-2x"></span>
                                </button>
                            </c:if>
                            <c:if test="${producto.estadoProducto == 0}">
                                <button class="btn btn-sm btn-cambiar-estado-producto" data-idproducto="${producto.idProducto}">
                                    <span class="fa fa-refresh fa-2x"></span>
                                </button>
                            </c:if>  
                                
                        </td>
                        <td>${producto.nombreProducto}</td>
                        <td>${producto.categoria.nombreCategoria}</td>
                        <td>${producto.stockProducto}</td>
                        <td>${producto.precioProducto}</td>
                        <td>
                            <c:if test="${producto.estadoProducto == 1}">Sí</c:if>
                            <c:if test="${producto.estadoProducto == 0}">No</c:if>  
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</div>

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="modalProducto">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <div class="centrar-texto-modal">
                    <h4 class="modal-title" id="myModalLabel">Confirmar</h4>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <p class="text-center">¿Está seguro de eliminar el producto?</p>
            </div>
            <div class="modal-footer">
                <div class="centrar-texto-modal">
                    <button type="button" class="btn btn-danger" id="modalProducto-btn-si">Si</button>
                    <button type="button" class="btn btn-secondary" id="modalProducto-btn-no">No</button>
                </div>
            </div>

        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp"%>
