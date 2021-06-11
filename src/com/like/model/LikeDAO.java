package com.like.model;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.article.model.ArticleDAO;
import com.article.model.ArticleService;
import com.article.model.ArticleVO;

public class LikeDAO implements LikeDAO_interface{
	
	// �@�����ε{����,�w��@�Ӹ�Ʈw ,�@�Τ@��DataSource�Y�i
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CEA103G3");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}	
	private static final String INSERT_STMT = 
			"INSERT INTO `like` (article_no,member_no) VALUES (?,?)";
		private static final String GET_ALL_STMT = 
			"SELECT * FROM `like` order by article_no, member_no";
		private static final String GET_ONE_STMT = 
			"SELECT article_no,member_no FROM `like` where article_no = ? and member_no =?";
		private static final String DELETE = 
			"DELETE FROM `like` where article_no = ? and member_no =?";
		private static final String UPDATE = 
			"UPDATE `like` set article_no = ?,member_no=? where article_no = ? and member_no =?";
		private static final String SELECT_INSERT_OR_UPDATE_STMT = 
				"select IF(EXISTS(select * from `like` where article_no = ? and member_no = ?),'update','insert' )as `action`";
		private static final String GET_LIKE_BY_ARTICLE_STMT = 
				"select count(*) from `like` where article_no = ?";
		
	
	public void insert(LikeVO likeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, likeVO.getArticleno());
			pstmt.setInt(2, likeVO.getMemberno());


			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}	
	}

	@Override
	public void update(LikeVO likeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, likeVO.getMemberno());
			pstmt.setInt(2, likeVO.getArticleno());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		
	}

	@Override
	public void delete(Integer articleno,Integer memberno) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, articleno);
			pstmt.setInt(2, memberno);


			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		
	}

	@Override
	public LikeVO findByPrimaryKey(Integer articleno,Integer memberno) {
		LikeVO likeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, articleno);
			pstmt.setInt(2, memberno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]�٬� Domain objects
				likeVO = new LikeVO();
				likeVO.setArticleno(rs.getInt("article_no"));
				likeVO.setMemberno(rs.getInt("member_no"));

			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return likeVO;
	}


	public List<LikeVO> getAll() {
		List<LikeVO> list = new ArrayList<LikeVO>();
		LikeVO likeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO �]�٬� Domain objects
				likeVO = new LikeVO();
				likeVO.setArticleno(rs.getInt("article_no"));
				likeVO.setMemberno(rs.getInt("member_no"));
				list.add(likeVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	@Override
	public void insertLikeAndUpdateLikeCount(LikeVO likeVO) {
		//�^�ǭ�true�O+1 , false�O-1
		
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;	
		ResultSet rs = null;
		boolean returnValue = true;
		//���F�P�ɧ�s�峹���g��, �ޤJarticle service
		ArticleService articleSvc = new ArticleService();
		
		
		try {

			con = ds.getConnection();			
			// 1���]�w�� pstm.executeUpdate()���e
			con.setAutoCommit(false);
			
			//���j�M�O�_���o������
			pstmt1 = con.prepareStatement(SELECT_INSERT_OR_UPDATE_STMT);	
			pstmt1.setInt(1, likeVO.getArticleno());
			pstmt1.setInt(2, likeVO.getMemberno());
			rs = pstmt1.executeQuery();
			//�A�P�_�O�n�s�W�٬O��s
			rs.next();
			if(rs.getString("action").equals("insert")) {
				pstmt2 = con.prepareStatement(INSERT_STMT);			
				pstmt2.setInt(1, likeVO.getArticleno());
				pstmt2.setInt(2, likeVO.getMemberno());
				pstmt2.executeUpdate();	
				
				// �A�P�ɧ�s�峹��檺�g�� +1
				articleSvc.addArticleLike(likeVO.getArticleno() ,con);
				returnValue = true;
			}else {
				pstmt2 = con.prepareStatement(DELETE);	
				pstmt2.setInt(1, likeVO.getArticleno());
				pstmt2.setInt(2, likeVO.getMemberno());
				pstmt2.executeUpdate();	
				// �A�P�ɧ�s�峹��檺�g�� -1
				articleSvc.subtractArticleLike(likeVO.getArticleno() ,con);
			}

			// 2���]�w�� pstm.executeUpdate()����
			con.commit();
			con.setAutoCommit(true);
			
			// Handle any SQL errors
		} catch (SQLException se) {
			se.printStackTrace();
			if (con != null) {
				try {
					// 3���]�w���exception�o�ͮɤ�catch�϶���
					System.err.print("------------------------------------Transaction is being ");
					System.err.println("rolled back-��-rating");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt2 != null) {
				try {
					pstmt2.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt1 != null) {
				try {
					pstmt1.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}
}

