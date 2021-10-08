<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Agenda de contatos</title>
<link rel="icon" href="imagens/favicon.png">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h1>Editar contato</h1>

	<form name="frmContato" action="insert">
		<table>
			<tr>
				<td><input type="text" name="idcon" readOnly id="Caixa3"></td>
			</tr>
			<tr>
				<td><input type="text" name="nome" class="Caixa1"></td>
			</tr>
			<tr>
				<td><input type="text" name="fone" class="Caixa2"></td>
			</tr>
			<tr>
				<td><input type="text" name="email"class="Caixa1"></td>
			</tr>
		</table>
		<input type="button" value="Salvar" class="Botao1" 
		onclick="validar()">
	</form>
	<script src="scripts/validador.js"></script>
</body>
</html>