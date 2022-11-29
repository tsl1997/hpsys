package cn.k2502.config.security;

import cn.k2502.config.security.handler.HpSysAuthenticationFailedHandler;
import cn.k2502.config.security.handler.HpSysAuthenticationSuccessHandler;
import cn.k2502.pojo.Account;
import cn.k2502.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * SpringSecurity的配置
 * @author HMB-XS
 * @date 2022年11月21日18:14:50
 **/
@SpringBootConfiguration
public class SecurityConfig  extends WebSecurityConfigurerAdapter {
	/**
	 * 静态资源放行
	 * @param web
	 * @throws Exception
	 */
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers(
				"/images/**",
				"/css/**",
				"/js/**",
				"/element-ui/**"
		);
	}

	@Autowired
	private HpSysAuthenticationSuccessHandler hpSysAuthenticationSuccessHandler;
	@Autowired
	private HpSysAuthenticationFailedHandler hpSysAuthenticationFailedHandler;
	@Autowired
	private  PersistentTokenRepository persistentTokenRepository;
	/**
	 * 配置表单的登录信息
	 * @param http
	 * @throws Exception
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// 开启跨域保护，防止跨站攻击
		http.csrf().disable()
				// 允许嵌套
				.headers().frameOptions().disable()
				.and()
					.formLogin()
					.usernameParameter("userName")
					.passwordParameter("password")
					.loginPage("/index")
					// 登录的逻辑操作由SpringSecurity完成
					.loginProcessingUrl("/login")
					// 配置登录的后处理器
					.successHandler(hpSysAuthenticationSuccessHandler)
					.failureHandler(hpSysAuthenticationFailedHandler)
				.and()
					.rememberMe()
					.rememberMeParameter("rememberMe")
					.rememberMeCookieName("remember-me-cookie")
					// 设置token过期时间
					.tokenValiditySeconds(7*24*60*60)
					.tokenRepository(persistentTokenRepository)
				.and()
					.logout()
					.logoutUrl("/logout")
				.and()
				// 放行登录相关网页资源
				.authorizeRequests().antMatchers("/index","login").permitAll()
				.anyRequest().authenticated();
	}

	@Autowired
	private IAccountService accountService;
	/**
	 * 实现登录
	 */
	@Bean
	public UserDetailsService userDetailsService(){
		return new UserDetailsService(){
			@Override
			public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
				// 根据用户名查询用户对象
				// 密码校验交给SpringSecurity
				Account account = accountService.login(userName);
				return account;
			}
		};
	}

	/**
	 * 密码解析器
	 */
	@Bean
	public PasswordEncoder encoder(){
		return new BCryptPasswordEncoder();
	}

	/**
	 * 应用密码加密规则
	 * @param auth
	 * @throws Exception
	 */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService())
				.passwordEncoder(encoder());
	}

	@Resource
	private DataSource dataSource;

	@Bean
	public PersistentTokenRepository persistentTokenRepository(){
		JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(dataSource);
//		jdbcTokenRepository.setCreateTableOnStartup(true);
		return jdbcTokenRepository;
	}


}
