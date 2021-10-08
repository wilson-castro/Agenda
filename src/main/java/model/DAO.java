package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.ConnectionFactory;

public class DAO {
	private Connection connection;

	public DAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public void inserirContato(JavaBeans contato) {
		String sql = "insert into contatos(nome,email,fone)" + "values (?,?,?);";

		try {
			// prepared statement para inserção
			PreparedStatement stmt = connection.prepareStatement(sql);

			// seta os valores
			stmt.setString(1, contato.getNome());
			stmt.setString(2, contato.getEmail());
			stmt.setString(3, contato.getFone());

			// executa
			stmt.executeUpdate();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public ArrayList<JavaBeans> ListarContatos() {
		String sql = "select * from contatos order by idcon";
		
        try {
        	ArrayList<JavaBeans> contatos = new ArrayList<JavaBeans>();
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // criando o objeto Contato
            	JavaBeans contato = new JavaBeans();
            	
                contato.setIdcon(rs.getString("idcon"));
                contato.setNome(rs.getString("nome"));
                contato.setEmail(rs.getString("email"));
                contato.setFone(rs.getString("fone"));

                // adicionando o objeto à lista
                contatos.add(contato);
            }
            
            rs.close();
            stmt.close();
            
            return contatos;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
	
	public void selecionarContato(JavaBeans contato) {
        String sql = "select * from contatos where idcon=?";
        
        try {        	
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, contato.getIdcon());
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				contato.setIdcon(rs.getString("idcon"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setFone(rs.getString("fone"));

			}
			
			rs.close();
            stmt.close();
			
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }
        
	}
}
