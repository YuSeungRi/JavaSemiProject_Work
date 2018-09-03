package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbutil.DBConn;
import dto.FileDto;

public class FileDaoImpl implements FileDao {

	private Connection conn = DBConn.getConnection();
	private PreparedStatement ps;
	private ResultSet rs;
	
	@Override
	public void uploadFile(FileDto dto) {
		
		String sql = "INSERT INTO attach_file(file_no, board_no,uploader_email, file_name, file_storedname, file_type) VALUES ("
				+ " atach_file_seq.nextval,"
				+ " ?," // 1. boardNo.
				+ " ?," // 2. uploader_email
				+ " ?," // 3. file_name
				+ " ?," // 4. file_storedname
				+ " ?)"; // 5. file_type
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getBoardNo());
			ps.setString(2, dto.getUploaderEmail());
			ps.setString(3, dto.getFileName());
			ps.setString(4, dto.getFileStoredName());
			ps.setString(5, dto.getFileType());
			
			ps.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
	}

	@Override
	public ArrayList<FileDto> getFileList(int boardNo) {
		ArrayList<FileDto> dtos = new ArrayList<>();
		FileDto dto = null;
		
		String sql = "SELECT * FROM attach_file WHERE board_no = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardNo);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				dto = new FileDto();
				dto.setFileNo(rs.getInt("file_no"));
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setUploaderEmail(rs.getString("uploader_email"));
				dto.setFileName(rs.getString("file_name"));
				dto.setFileStoredName(rs.getString("file_storedname"));
				dto.setFileType(rs.getString("file_type"));
				
				dtos.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		return dtos;
	}

	@Override
	public void deleteFile(int fileNo) {
		String sql = "DELETE attach_file WHERE file_no = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fileNo);
			
			ps.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		
	}

	@Override
	public FileDto getFileData(int fileNo) {
		FileDto dto = null;
		String sql = "SELECT * FROM attach_file WHERE file_no = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fileNo);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				dto = new FileDto();
				dto.setFileNo(rs.getInt("file_no"));
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setUploaderEmail(rs.getString("uploader_email"));
				dto.setFileName(rs.getString("file_name"));
				dto.setFileStoredName(rs.getString("file_storedname"));
				dto.setFileType(rs.getString("file_type"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}	
		return dto;
	}

}
