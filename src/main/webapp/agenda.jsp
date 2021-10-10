<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.JavaBeans"%>
<%@ page import="java.util.ArrayList"%>

<%
ArrayList<JavaBeans> contatos = (ArrayList<JavaBeans>) request.getAttribute("contatos");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Agenda de contatos</title>
<link rel="icon" href="imagens/favicon.png">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h1>Agenda de contatos</h1>
	<a href="novo.html" class="Botao1">Novo contato</a>

	<table id="tabela">
		<thead>
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>Fone</th>
				<th>E-mail</th>
				<th>Opções</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (JavaBeans contato : contatos) {
			%>
			<tr>
				<td><%= contato.getIdcon() %></td>
				<td><%= contato.getNome() %></td>
				<td><%= contato.getFone() %></td>
				<td><%= contato.getEmail() %></td>
				<td>
				<a href="select?idcon=<%= contato.getIdcon() %>" class="Botao1">Editar</a>
				<a href="javascript: confirmar(<%= contato.getIdcon() %>)" class="Botao2">Excluir</a>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<script src="scripts/confirmador.js"></script>
</body>
</html>