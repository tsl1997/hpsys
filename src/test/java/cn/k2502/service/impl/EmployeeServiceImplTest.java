package cn.k2502.service.impl;

import cn.k2502.dto.req.EmployeeQuery;
import cn.k2502.service.IEmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Map;

/**
 * @author HMB-XS
 * @date 2022年11月28日21:30:46
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class EmployeeServiceImplTest {
	@Autowired
	private IEmployeeService employeeService;

	@Test
	public void testSelect(){
		EmployeeQuery employeeQuery = new EmployeeQuery();
		Map<String, Object> map = employeeService.employeeList(employeeQuery);
		System.out.println(map);
	}
}
