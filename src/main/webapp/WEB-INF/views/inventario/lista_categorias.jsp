<%-- 
    Document   : lista_categorias
    Created on : 01/11/2017, 09:12:04 PM
    Author     : FERNANDO
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../includes/headerInventario.jsp"%>

<div class="container">
    <div class="titulo">
        <h1 class="text-center">Categorías</h1>
        <div class="clearfix"></div><hr>
    </div>
    <div class="row">
        <div class="col-md-6">
            <table class="table table-sm table-hover table-bordered">
                <thead class="thead-inverse">
                <th></th>
                <th>Nombre</th>
                <th>Descripción</th>
                </thead>
                <tbody>
                    <c:forEach items="${listaCategorias}" var="categoria">
                        <tr>
                            <td class="text-center icon">
                                <a href="${pageContext.request.contextPath}/inventario/listaCategorias?edit=${categoria.idCategoria}" class="btn btn-sm"><span class="fa fa-pencil fa-2x"></span></a>
                                <button class="btn btn-sm btn-categoria" data-value="${categoria.idCategoria}"><span class="fa fa-times-circle fa-2x"></span></button>
                            </td>
                            <td>${categoria.nombreCategoria}</td>
                            <td>${categoria.descCategoria}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-md-6">
            <h3 class="text-center">
                <c:choose><c:when test="${swEditar eq 1}">Editar </c:when><c:otherwise>Agregar </c:otherwise></c:choose>una categoría
                    </h3>

                    <form action="categoria" method="POST">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="nombre">Nombre*:</label>
                        
                        <c:choose>
                            <c:when test="${swEditar eq 1}">
                                <input type="hidden" name="id" value="${categoria.idCategoria}">
                                <input value="${categoria.nombreCategoria}" class="form-control" type="text" id="nombre" name="nombre">
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" name="id" value="0">
                                <input class="form-control" type="text" id="nombre" name="nombre">
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="descripcion">Descripción:</label>
                        <c:choose>
                            <c:when test="${swEditar eq 1}">
                                <textarea name="descripcion" id="descripcion" class="form-control" rows="6">${categoria.descCategoria}</textarea>
                            </c:when>
                            <c:otherwise>
                                <textarea name="descripcion" id="descripcion" class="form-control" rows="6"></textarea>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="form-group pull-right">
                    <input type="submit" class="form-control btn btn-warning pull-right" value="<c:choose><c:when test="${swEditar eq 1}">Editar</c:when><c:otherwise>Registrar</c:otherwise></c:choose>">
                        </div><div class="clearfix"></div>

                <c:if test="${swEditar eq 1}">
                    <div class="form-group pull-right">
                        <a href="${pageContext.request.contextPath}/inventario/listaCategorias" class="form-control btn btn-secondary">Cancelar</a>
                    </div><div class="clearfix"></div>
                </c:if>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="modalCategoria">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <div class="centrar-texto-modal">
                    <h4 class="modal-title" id="myModalLabel">Confirmar</h4>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <p class="text-center">¿Está seguro de eliminar la categoría?</p>
            </div>
            <div class="modal-footer">
                <div class="centrar-texto-modal">
                    <button type="button" class="btn btn-danger" id="modalCategoria-btn-si">Si</button>
                    <button type="button" class="btn btn-secondary" id="modalCategoria-btn-no">No</button>
                </div>
            </div>

        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp"%>