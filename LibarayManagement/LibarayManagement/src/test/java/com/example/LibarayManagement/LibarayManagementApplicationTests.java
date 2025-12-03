package com.example.LibarayManagement;

import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

@SpringBootTest
class LibarayManagementApplicationTests {

	@Mock
	JdbcTemplate jdbcTemplate;
	
	@Test
	public void checkCountTest()
	{
		 String query="select\n" +
				 "count(*)\n"+
		   "from BOOKISSUE\n"+  
		 "where\n"+
		   "MOBILENUMBER=?";
       
//        MapSqlParameterSource mapParameters = new MapSqlParameterSource();
//    	mapParameters.addValue("MOBILENUMBER",9630729990L );
//    	
//    	Mockito.when(jdbcTemplate.update(Mockito.anyString(), Mockito.any(MapSqlParameterSource.class)))
//		.thenReturn(1);
//    	
//    	Assertions.assertEquals(1, namedParameterJdbcTemplate.update(sql, mapParameters));
//			Integer integer = new Integer(1);
////    	Mockito.when(jdbcTemplate.query(Mockito.anyString(),
//    			Mockito.any(), Mockito.<Class> any())).thenAnswer(x -> integer);
//    	
//    

    	
    	
    	
	}

}
